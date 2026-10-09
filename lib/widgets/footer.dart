import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';

class Footer extends StatelessWidget {
  final Function(String section) onNavClick;

  const Footer({
    super.key,
    required this.onNavClick,
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
    final isTablet = screenWidth >= 640;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppTheme.bgDark,
        border: Border(top: BorderSide(color: AppTheme.borderSubtle, width: 1)),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 48 : (isTablet ? 32 : 20),
        vertical: 64,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Column(
            children: [
              isDesktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Col 1: Brand & Bio
                        Expanded(flex: 5, child: _buildBrandCol()),
                        const SizedBox(width: 48),
                        // Col 2: Navigation
                        Expanded(flex: 3, child: _buildNavCol()),
                        const SizedBox(width: 32),
                        // Col 3: Services
                        Expanded(flex: 3, child: _buildServicesCol()),
                        const SizedBox(width: 32),
                        // Col 4: Contact & Social
                        Expanded(flex: 4, child: _buildContactCol()),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildBrandCol(),
                        const SizedBox(height: 36),
                        Wrap(
                          spacing: 48,
                          runSpacing: 32,
                          children: [
                            _buildNavCol(),
                            _buildServicesCol(),
                            _buildContactCol(),
                          ],
                        ),
                      ],
                    ),
              const Divider(color: AppTheme.borderSubtle, height: 64),

              // Bottom bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '© ${DateTime.now().year} ${PortfolioData.designerName} (${PortfolioData.brandName}). All rights reserved.',
                      style: const TextStyle(color: AppTheme.textMuted, fontSize: 12),
                    ),
                  ),
                  const Text(
                    'Built with Flutter Web',
                    style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrandCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppTheme.primaryBlue.withValues(alpha: 0.5),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primaryBlue.withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                'assets/logo/avomedia_badge.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  PortfolioData.brandName,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 17),
                ),
                Text(
                  PortfolioData.designerName,
                  style: TextStyle(color: AppTheme.goldAccentLight, fontSize: 11, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'Graphic Designer & Visual Creative specializing in brand identity systems, high-converting event flyers, and church ministry campaigns that command authority.',
          style: TextStyle(color: AppTheme.textSecondary, fontSize: 13, height: 1.5),
        ),
        const SizedBox(height: 16),
        const Row(
          children: [
            Icon(Icons.location_on_outlined, size: 14, color: AppTheme.textMuted),
            SizedBox(width: 6),
            Text(
              'Abuja, Nigeria • Available Worldwide',
              style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNavCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Explore', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14)),
        const SizedBox(height: 14),
        _FooterLink(label: 'Featured Work', onTap: () => onNavClick('featured')),
        _FooterLink(label: 'Full Portfolio', onTap: () => onNavClick('portfolio')),
        _FooterLink(label: 'Services & Scope', onTap: () => onNavClick('services')),
        _FooterLink(label: 'Pricing & Packages', onTap: () => onNavClick('pricing')),
        _FooterLink(label: 'Quote Estimator', onTap: () => onNavClick('quote')),
        _FooterLink(label: 'About Designer', onTap: () => onNavClick('about')),
      ],
    );
  }

  Widget _buildServicesCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Specialties', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14)),
        const SizedBox(height: 14),
        _FooterLink(label: 'Brand Identity Systems', onTap: () => onNavClick('services')),
        _FooterLink(label: 'Church & Ministry Flyers', onTap: () => onNavClick('services')),
        _FooterLink(label: 'International Event Posters', onTap: () => onNavClick('services')),
        _FooterLink(label: 'Social Media Ad Creatives', onTap: () => onNavClick('services')),
        _FooterLink(label: 'Book & Editorial Covers', onTap: () => onNavClick('services')),
      ],
    );
  }

  Widget _buildContactCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Direct Channels', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14)),
        const SizedBox(height: 14),
        _FooterLink(
          label: 'WhatsApp: ${PortfolioData.whatsappNumber}',
          onTap: () => _launchUrl(PortfolioData.buildWhatsAppUrl()),
          icon: Icons.chat_bubble_outline,
          color: AppTheme.whatsappGreen,
        ),
        _FooterLink(
          label: 'Email: ${PortfolioData.email}',
          onTap: () => _launchUrl('mailto:${PortfolioData.email}'),
          icon: Icons.mail_outline,
        ),
        _FooterLink(
          label: 'Instagram: @adevictorolu',
          onTap: () => _launchUrl(PortfolioData.instagramPersonalUrl),
          icon: Icons.camera_alt_outlined,
        ),
        _FooterLink(
          label: 'Instagram: @avomedia0',
          onTap: () => _launchUrl(PortfolioData.instagramBrandUrl),
          icon: Icons.verified_user_outlined,
        ),
        _FooterLink(
          label: 'Pinterest: @adevictorolu',
          onTap: () => _launchUrl(PortfolioData.pinterestUrl),
          icon: Icons.photo_library_outlined,
        ),
        _FooterLink(
          label: 'Behance: @ademolavictor1',
          onTap: () => _launchUrl(PortfolioData.behanceUrl),
          icon: Icons.palette_outlined,
        ),
      ],
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  final Color? color;

  const _FooterLink({
    required this.label,
    required this.onTap,
    this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 14, color: color ?? AppTheme.textMuted),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: TextStyle(
                color: color ?? AppTheme.textSecondary,
                fontSize: 13,
                fontWeight: color != null ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
