import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import '../services/pinterest_service.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onStartProject;
  final VoidCallback onViewWork;

  const HeroSection({
    super.key,
    required this.onStartProject,
    required this.onViewWork,
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
    final isDesktop = screenWidth >= 960;

    return Container(
      width: double.infinity,
      color: AppTheme.bgDark,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 48 : 24,
        vertical: isDesktop ? 72 : 44,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1080),
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 11,
                      child: _buildTextContent(context, isDesktop),
                    ),
                    const SizedBox(width: 48),
                    Expanded(
                      flex: 9,
                      child: _buildMinimalShowcase(),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextContent(context, isDesktop),
                    const SizedBox(height: 36),
                    _buildMinimalShowcase(),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildTextContent(BuildContext context, bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Live Pinterest Auto-Sync Pill
        InkWell(
          onTap: () => PinterestService.instance.syncNow(),
          borderRadius: BorderRadius.circular(24),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.bgCard,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppTheme.borderSubtle),
            ),
            child: ValueListenableBuilder<bool>(
              valueListenable: PinterestService.instance.isSyncingNotifier,
              builder: (context, isSyncing, _) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: isSyncing ? AppTheme.primaryBlueLight : AppTheme.whatsappGreen,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      isSyncing
                          ? 'Syncing Pinterest @adevictorolu...'
                          : 'Live Pinterest Feed • @adevictorolu',
                      style: const TextStyle(
                        color: AppTheme.textSecondary,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 22),

        // Minimalist Hero Headline
        Text(
          PortfolioData.heroHeadline,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: isDesktop ? 56 : 36,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                letterSpacing: -1.4,
                height: 1.08,
              ),
        ),
        const SizedBox(height: 16),

        // Concise 1-Line Subtitle
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Text(
            PortfolioData.heroSubheadline,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: isDesktop ? 18 : 15,
                  color: AppTheme.textSecondary,
                  height: 1.45,
                ),
          ),
        ),
        const SizedBox(height: 28),

        // Clean CTA Row
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton(
              onPressed: onViewWork,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryBlue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'View Work',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
              ),
            ),
            OutlinedButton(
              onPressed: onStartProject,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: AppTheme.borderCard),
                backgroundColor: AppTheme.bgCard,
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Start Project',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
            IconButton(
              tooltip: 'Pinterest @adevictorolu',
              onPressed: () => _launchUrl(PortfolioData.pinterestUrl),
              icon: const Icon(Icons.push_pin_outlined, size: 18, color: AppTheme.textSecondary),
              style: IconButton.styleFrom(
                backgroundColor: AppTheme.bgCard,
                side: const BorderSide(color: AppTheme.borderSubtle),
                padding: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            IconButton(
              tooltip: 'Instagram @adevictorolu',
              onPressed: () => _launchUrl(PortfolioData.instagramPersonalUrl),
              icon: const Icon(Icons.camera_alt_outlined, size: 18, color: AppTheme.textSecondary),
              style: IconButton.styleFrom(
                backgroundColor: AppTheme.bgCard,
                side: const BorderSide(color: AppTheme.borderSubtle),
                padding: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            IconButton(
              tooltip: 'Behance @ademolavictor1',
              onPressed: () => _launchUrl(PortfolioData.behanceUrl),
              icon: const Icon(Icons.palette_outlined, size: 18, color: AppTheme.textSecondary),
              style: IconButton.styleFrom(
                backgroundColor: AppTheme.bgCard,
                side: const BorderSide(color: AppTheme.borderSubtle),
                padding: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMinimalShowcase() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.bgCard,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppTheme.borderSubtle),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AspectRatio(
              aspectRatio: 16 / 10,
              child: Image.asset(
                'assets/logo/avomedia_logo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildThumb('assets/portfolio/behance/church_service_flyer.jpg'),
              const SizedBox(width: 10),
              _buildThumb('assets/portfolio/behance/tech_conference_flyer.jpg'),
              const SizedBox(width: 10),
              _buildThumb('assets/portfolio/behance/book_cover_design.jpg'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildThumb(String path) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          height: 64,
          child: Image.asset(
            path,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => Container(color: AppTheme.bgElevated),
          ),
        ),
      ),
    );
  }
}
