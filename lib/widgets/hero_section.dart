import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';

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
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 768;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppTheme.bgDark,
        gradient: RadialGradient(
          center: Alignment(0.6, -0.6),
          radius: 1.4,
          colors: [
            Color(0xFF14203B),
            AppTheme.bgDark,
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 48 : (isTablet ? 32 : 20),
        vertical: isDesktop ? 80 : 48,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Left Content Column
                    Expanded(
                      flex: 11,
                      child: _buildHeroTextContent(context, isDesktop),
                    ),
                    const SizedBox(width: 48),
                    // Right Showcase Column
                    Expanded(
                      flex: 9,
                      child: _buildHeroVisualShowcase(context),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeroTextContent(context, isDesktop),
                    const SizedBox(height: 48),
                    _buildHeroVisualShowcase(context),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildHeroTextContent(BuildContext context, bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Trust & Scale Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: AppTheme.goldAccent.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: AppTheme.goldAccent.withValues(alpha: 0.35),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppTheme.goldAccentLight,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                '500+ PROJECTS DELIVERED • NIGERIAN & GLOBAL CLIENTS',
                style: TextStyle(
                  color: AppTheme.goldAccentLight,
                  fontWeight: FontWeight.w700,
                  fontSize: 11,
                  letterSpacing: 0.8,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Main Hero Statement
        Text(
          PortfolioData.heroHeadline,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: isDesktop ? 50 : 34,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                height: 1.12,
              ),
        ),
        const SizedBox(height: 20),

        // Value Proposition Subtitle
        Text(
          PortfolioData.heroSubheadline,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: isDesktop ? 17 : 15,
                color: AppTheme.textSecondary,
                height: 1.6,
              ),
        ),
        const SizedBox(height: 32),

        // CTA Buttons Row
        Wrap(
          spacing: 16,
          runSpacing: 14,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: onStartProject,
              icon: const Icon(Icons.arrow_forward_rounded, size: 18),
              label: const Text('Start a Project'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryBlue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 6,
                textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
            ),
            OutlinedButton.icon(
              onPressed: onViewWork,
              icon: const Icon(Icons.grid_view_rounded, size: 18),
              label: const Text('View My Work'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: AppTheme.borderCard, width: 1.5),
                backgroundColor: AppTheme.bgSurface.withValues(alpha: 0.6),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ),
            // WhatsApp direct chip
            TextButton.icon(
              onPressed: () => _launchUrl(PortfolioData.buildWhatsAppUrl()),
              icon: const Icon(Icons.chat_bubble_outline_rounded, color: AppTheme.whatsappGreen, size: 18),
              label: const Text(
                'Chat on WhatsApp',
                style: TextStyle(color: AppTheme.whatsappGreen, fontWeight: FontWeight.w600, fontSize: 14),
              ),
              style: TextButton.styleFrom(
                backgroundColor: AppTheme.whatsappGreen.withValues(alpha: 0.1),
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: AppTheme.whatsappGreen.withValues(alpha: 0.25)),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 36),

        // Social Connections
        Row(
          children: [
            const Text(
              'Explore Channels:',
              style: TextStyle(
                color: AppTheme.textMuted,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 12),
            _SocialIcon(
              tooltip: 'Pinterest Portfolio (@adevictorolu)',
              icon: Icons.photo_camera_back_outlined,
              onTap: () => _launchUrl(PortfolioData.pinterestUrl),
            ),
            const SizedBox(width: 8),
            _SocialIcon(
              tooltip: 'Instagram Creative (@adevictorolu)',
              icon: Icons.camera_alt_outlined,
              onTap: () => _launchUrl(PortfolioData.instagramPersonalUrl),
            ),
            const SizedBox(width: 8),
            _SocialIcon(
              tooltip: 'Instagram Studio (@avomedia0)',
              icon: Icons.verified_user_outlined,
              onTap: () => _launchUrl(PortfolioData.instagramBrandUrl),
            ),
            const SizedBox(width: 8),
            _SocialIcon(
              tooltip: 'Behance Portfolio (@ademolavictor1)',
              icon: Icons.palette_outlined,
              onTap: () => _launchUrl(PortfolioData.behanceUrl),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeroVisualShowcase(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.bgCard,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppTheme.borderCard, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryBlue.withValues(alpha: 0.12),
            blurRadius: 32,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Showcase Header Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: const BoxDecoration(
              color: AppTheme.bgSurface,
              border: Border(bottom: BorderSide(color: AppTheme.borderSubtle)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(width: 10, height: 10, decoration: const BoxDecoration(color: Color(0xFFEF4444), shape: BoxShape.circle)),
                    const SizedBox(width: 6),
                    Container(width: 10, height: 10, decoration: const BoxDecoration(color: Color(0xFFF59E0B), shape: BoxShape.circle)),
                    const SizedBox(width: 6),
                    Container(width: 10, height: 10, decoration: const BoxDecoration(color: Color(0xFF10B981), shape: BoxShape.circle)),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.goldAccent.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'CURATED MASTERWORK',
                    style: TextStyle(
                      color: AppTheme.goldAccentLight,
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                      letterSpacing: 0.6,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Artwork Showcase Image
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 16 / 10,
                child: Image.asset(
                  'assets/portfolio/instagram/ig_personal_5.webp',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/portfolio/behance/church_service_flyer.jpg',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 12,
                left: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.bgDark.withValues(alpha: 0.92),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppTheme.borderCard),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '420+ Designs Portfolio Showcase — @adevictorolu',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'Churches, Commercial Brands, Book Covers & Events',
                              style: TextStyle(
                                color: AppTheme.goldAccentLight,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryBlue.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'Verified Catalog',
                          style: TextStyle(
                            color: AppTheme.primaryBlueLight,
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Mini Preview Strip of Other Works
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _buildThumbnail('assets/portfolio/behance/brand_identity_design.jpg', 'Branding'),
                const SizedBox(width: 10),
                _buildThumbnail('assets/portfolio/behance/church_service_flyer.jpg', 'Church Service'),
                const SizedBox(width: 10),
                _buildThumbnail('assets/portfolio/behance/tech_conference_flyer.jpg', 'Tech Summit'),
                const SizedBox(width: 10),
                _buildThumbnail('assets/portfolio/behance/book_cover_design.jpg', 'Book Cover'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThumbnail(String path, String label) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppTheme.borderSubtle),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              path,
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (_, _, _) => Container(color: AppTheme.bgElevated),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: AppTheme.textMuted,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final String tooltip;
  final IconData icon;
  final VoidCallback onTap;

  const _SocialIcon({
    required this.tooltip,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: _hovered ? AppTheme.goldAccent.withValues(alpha: 0.2) : AppTheme.bgCard,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _hovered ? AppTheme.goldAccent : AppTheme.borderSubtle,
                width: 1,
              ),
            ),
            child: Icon(
              widget.icon,
              size: 18,
              color: _hovered ? AppTheme.goldAccentLight : AppTheme.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
