import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../models/project_item.dart';
import '../data/portfolio_data.dart';
import 'project_artwork_image.dart';

class ProjectDetailModal extends StatelessWidget {
  final ProjectItem project;
  final VoidCallback onStartProject;

  const ProjectDetailModal({
    super.key,
    required this.project,
    required this.onStartProject,
  });

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _launchWhatsApp() async {
    final url = PortfolioData.buildWhatsAppUrl(
      service: project.category,
      projectTitle: project.title,
      notes: 'I want a design similar to "${project.title}".',
    );
    await _launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 860;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 960,
          maxHeight: MediaQuery.of(context).size.height * 0.90,
        ),
        decoration: BoxDecoration(
          color: AppTheme.bgSurface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppTheme.borderCard),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Minimal Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: AppTheme.borderSubtle)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppTheme.bgCard,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AppTheme.borderSubtle),
                        ),
                        child: Text(
                          project.category,
                          style: const TextStyle(
                            color: AppTheme.primaryBlueLight,
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                          ),
                        ),
                      ),
                      if (project.isFromPinterest) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppTheme.pinterestRed.withValues(alpha: 0.14),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.push_pin, size: 11, color: AppTheme.pinterestRed),
                              SizedBox(width: 4),
                              Text(
                                'Pinterest',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close_rounded, color: AppTheme.textSecondary, size: 20),
                  ),
                ],
              ),
            ),

            // Body
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: isDesktop
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: 11, child: _buildArtwork()),
                          const SizedBox(width: 28),
                          Expanded(flex: 9, child: _buildInfo(context)),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildArtwork(),
                          const SizedBox(height: 20),
                          _buildInfo(context),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArtwork() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: AppTheme.bgCard,
        constraints: const BoxConstraints(maxHeight: 520),
        child: ProjectArtworkImage(
          project: project,
          fit: BoxFit.contain,
          alignment: Alignment.center,
        ),
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          project.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.4,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          '${project.client} • ${project.year}',
          style: const TextStyle(
            color: AppTheme.textMuted,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),

        // Caption
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppTheme.bgCard,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppTheme.borderSubtle),
          ),
          child: Text(
            project.caption,
            style: const TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 18),

        // Tags
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: [
            ...project.deliverables.map((d) => _TagPill(label: d)),
            ...project.tools.map((t) => _TagPill(label: t, isAccent: true)),
          ],
        ),
        const SizedBox(height: 24),

        // Actions
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            ElevatedButton.icon(
              onPressed: _launchWhatsApp,
              icon: const Icon(Icons.chat_bubble_outline, size: 15),
              label: const Text('Request Similar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryBlue,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
              ),
            ),
            if (project.sourceUrl != null && project.sourceUrl!.isNotEmpty)
              OutlinedButton.icon(
                onPressed: () => _launchUrl(project.sourceUrl!),
                icon: const Icon(Icons.open_in_new_rounded, size: 14),
                label: const Text('View on Pinterest'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.textPrimary,
                  side: const BorderSide(color: AppTheme.borderCard),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _TagPill extends StatelessWidget {
  final String label;
  final bool isAccent;

  const _TagPill({required this.label, this.isAccent = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: isAccent
            ? AppTheme.primaryBlue.withValues(alpha: 0.12)
            : AppTheme.bgElevated,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isAccent
              ? AppTheme.primaryBlue.withValues(alpha: 0.3)
              : AppTheme.borderSubtle,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isAccent ? AppTheme.primaryBlueLight : AppTheme.textSecondary,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
