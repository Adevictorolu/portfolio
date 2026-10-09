import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';

class Navbar extends StatelessWidget {
  final Function(String section) onNavClick;

  const Navbar({
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
    final isDesktop = MediaQuery.of(context).size.width >= 1024;

    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppTheme.bgDark.withValues(alpha: 0.92),
        border: const Border(
          bottom: BorderSide(color: AppTheme.borderSubtle, width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Brand Logo / Monogram
              InkWell(
                onTap: () => onNavClick('hero'),
                borderRadius: BorderRadius.circular(12),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppTheme.primaryBlue.withValues(alpha: 0.5),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.primaryBlue.withValues(alpha: 0.35),
                            blurRadius: 12,
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
                    const SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          PortfolioData.brandName,
                          style: TextStyle(
                            color: AppTheme.textPrimary,
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            letterSpacing: 0.2,
                          ),
                        ),
                        Text(
                          PortfolioData.titleTagline,
                          style: const TextStyle(
                            color: AppTheme.primaryBlueLight,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Desktop Navigation Menu
              if (isDesktop) ...[
                Row(
                  children: [
                    _NavLink(title: 'Featured', onTap: () => onNavClick('featured')),
                    _NavLink(title: 'Portfolio', onTap: () => onNavClick('portfolio')),
                    _NavLink(title: 'Services', onTap: () => onNavClick('services')),
                    _NavLink(title: 'Pricing', onTap: () => onNavClick('pricing')),
                    _NavLink(title: 'Quote Calculator', onTap: () => onNavClick('quote')),
                    _NavLink(title: 'About', onTap: () => onNavClick('about')),
                    _NavLink(title: 'Contact', onTap: () => onNavClick('contact')),
                  ],
                ),

                // Right Action Buttons
                Row(
                  children: [
                    // WhatsApp Quick Action
                    TextButton.icon(
                      onPressed: () => _launchUrl(PortfolioData.buildWhatsAppUrl()),
                      icon: const Icon(Icons.chat_bubble_outline, size: 16, color: AppTheme.whatsappGreen),
                      label: const Text(
                        'WhatsApp',
                        style: TextStyle(color: AppTheme.whatsappGreen, fontWeight: FontWeight.w600, fontSize: 13),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: AppTheme.whatsappGreen.withValues(alpha: 0.12),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: AppTheme.whatsappGreen.withValues(alpha: 0.3)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Primary CTA
                    ElevatedButton(
                      onPressed: () => onNavClick('inquiry'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryBlue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Start a Project',
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ] else ...[
                // Mobile / Tablet Hamburger & WhatsApp action
                Row(
                  children: [
                    IconButton(
                      tooltip: 'Chat on WhatsApp',
                      onPressed: () => _launchUrl(PortfolioData.buildWhatsAppUrl()),
                      icon: const Icon(Icons.chat_bubble_outline, color: AppTheme.whatsappGreen, size: 22),
                      style: IconButton.styleFrom(
                        backgroundColor: AppTheme.whatsappGreen.withValues(alpha: 0.12),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Builder(
                      builder: (scaffoldContext) {
                        return IconButton(
                          icon: const Icon(Icons.menu, color: AppTheme.textPrimary, size: 26),
                          onPressed: () {
                            Scaffold.of(scaffoldContext).openEndDrawer();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _NavLink({required this.title, required this.onTap});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            widget.title,
            style: TextStyle(
              color: _isHovered ? AppTheme.goldAccentLight : AppTheme.textSecondary,
              fontSize: 14,
              fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
