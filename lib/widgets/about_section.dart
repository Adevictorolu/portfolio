import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';

class AboutSection extends StatelessWidget {
  final VoidCallback onStartProject;

  const AboutSection({
    super.key,
    required this.onStartProject,
  });

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 700;

    return Container(
      width: double.infinity,
      color: AppTheme.bgSurface,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 48 : (isTablet ? 32 : 20),
        vertical: 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.goldAccent.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'BEHIND THE CREATIVE VISION',
                  style: TextStyle(
                    color: AppTheme.goldAccentLight,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'About AVO Media',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Avomedia, Creating beyond limit • Serving clients across Nigeria and worldwide.',
                style: TextStyle(fontSize: 15, color: AppTheme.textSecondary),
              ),
              const SizedBox(height: 48),

              isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left Visual Column (Avatar / Branding showcase)
                        Expanded(flex: 8, child: _buildVisualColumn(context)),
                        const SizedBox(width: 48),
                        // Right Narrative Column
                        Expanded(flex: 12, child: _buildBioColumn(context)),
                      ],
                    )
                  : Column(
                      children: [
                        _buildVisualColumn(context),
                        const SizedBox(height: 36),
                        _buildBioColumn(context),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVisualColumn(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.bgCard,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppTheme.borderCard),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 11,
            child: Image.asset(
              'assets/logo/banner_orig.jpg',
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Image.asset('assets/logo/avomedia_badge.png', fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          PortfolioData.brandName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          PortfolioData.titleTagline,
                          style: const TextStyle(
                            color: AppTheme.primaryBlueLight,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppTheme.whatsappGreen.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppTheme.whatsappGreen.withValues(alpha: 0.4)),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.circle, color: AppTheme.whatsappGreen, size: 8),
                          SizedBox(width: 6),
                          Text(
                            'Available for Hire',
                            style: TextStyle(color: AppTheme.whatsappGreen, fontSize: 11, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(color: AppTheme.borderSubtle, height: 28),
                const Row(
                  children: [
                    Icon(Icons.location_on_outlined, color: AppTheme.textMuted, size: 16),
                    SizedBox(width: 6),
                    Text(
                      'Abuja, Nigeria • Worldwide Remote',
                      style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBioColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Visuals That Drive Attention and Action',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w700,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'I am a Graphic Designer and Visual Creative focused on creating clear, strategic, and visually compelling designs for businesses, ministries, organizations, and creators.',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 15,
            height: 1.6,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 14),
        const Text(
          'Over the course of 500+ completed projects, I have partnered with brands and event organizers across Nigeria, the United States, the UK, and beyond. My approach is rooted in visual hierarchy: before an audience reads your words, they have already judged your credibility based on your visual presentation.',
          style: TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 14,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 14),
        const Text(
          'Whether crafting a luxury gala flyer for an international yacht cruise in Dallas, designing an apostolic jubilee program for a revered ministry, or developing a comprehensive brand identity system from the ground up, I engineer every composition to be impossible to ignore.',
          style: TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 14,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 28),

        // Core Design Principles
        const Text(
          'Creative Principles',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 14),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            _PrincipleCard(
              title: 'Strategic Clarity',
              desc: 'Every headline, date, and badge has a precise visual purpose.',
            ),
            _PrincipleCard(
              title: 'Color Psychology',
              desc: 'Palettes curated to evoke luxury, spiritual reverence, or festive energy.',
            ),
            _PrincipleCard(
              title: 'Print & Digital Precision',
              desc: 'High-DPI print files and pixel-perfect mobile feed optimizations.',
            ),
            _PrincipleCard(
              title: 'Rapid Reliability',
              desc: 'Strict adherence to project deadlines without compromising craft.',
            ),
          ],
        ),
        const SizedBox(height: 28),

        // Design Tools
        const Text(
          'Primary Creative Suite',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: const [
            _ToolPill(name: 'Adobe Photoshop', icon: Icons.brush_outlined),
            _ToolPill(name: 'Canva Pro', icon: Icons.grid_view_outlined),
            _ToolPill(name: 'Adobe Illustrator', icon: Icons.architecture_outlined),
            _ToolPill(name: 'Typography Systems', icon: Icons.text_fields_outlined),
          ],
        ),
        const SizedBox(height: 32),

        // Buttons
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            ElevatedButton(
              onPressed: onStartProject,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryBlue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Work With Me', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
            ),
            OutlinedButton.icon(
              onPressed: () => _launchUrl(PortfolioData.buildWhatsAppUrl()),
              icon: const Icon(Icons.chat_bubble_outline, size: 16, color: AppTheme.whatsappGreen),
              label: const Text('Direct WhatsApp Chat'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.whatsappGreen,
                side: const BorderSide(color: AppTheme.whatsappGreen),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _PrincipleCard extends StatelessWidget {
  final String title;
  final String desc;

  const _PrincipleCard({required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.bgCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderSubtle),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: AppTheme.goldAccentLight, fontWeight: FontWeight.w700, fontSize: 13),
          ),
          const SizedBox(height: 4),
          Text(
            desc,
            style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12, height: 1.4),
          ),
        ],
      ),
    );
  }
}

class _ToolPill extends StatelessWidget {
  final String name;
  final IconData icon;

  const _ToolPill({required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.bgCard,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.borderSubtle),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppTheme.primaryBlueLight),
          const SizedBox(width: 8),
          Text(
            name,
            style: const TextStyle(color: AppTheme.textPrimary, fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
