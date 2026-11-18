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
    final isDesktop = MediaQuery.of(context).size.width >= 960;

    return Container(
      height: 72,
      decoration: BoxDecoration(
        color: AppTheme.bgDark.withValues(alpha: 0.94),
        border: const Border(
          bottom: BorderSide(color: AppTheme.borderSubtle, width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Brand Mark
              InkWell(
                onTap: () => onNavClick('hero'),
                borderRadius: BorderRadius.circular(10),
                child: Row(
                  children: [
                    Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppTheme.primaryBlue.withValues(alpha: 0.4),
                          width: 1,
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        'assets/logo/avomedia_badge.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      PortfolioData.brandName,
                      style: TextStyle(
                        color: AppTheme.textPrimary,
                        fontWeight: FontWeight.w800,
                        fontSize: 17,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ],
                ),
              ),

              if (isDesktop) ...[
                Row(
                  children: [
                    _NavLink(title: 'Work', onTap: () => onNavClick('portfolio')),
                    _NavLink(title: 'Services', onTap: () => onNavClick('services')),
                    _NavLink(title: 'Pricing', onTap: () => onNavClick('pricing')),
                    _NavLink(title: 'About', onTap: () => onNavClick('about')),
                    _NavLink(title: 'Contact', onTap: () => onNavClick('inquiry')),
                  ],
                ),
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: () => _launchUrl(PortfolioData.pinterestUrl),
                      icon: const Icon(Icons.push_pin_outlined, size: 15, color: AppTheme.pinterestRed),
                      label: const Text(
                        'Pinterest',
                        style: TextStyle(
                          color: AppTheme.textPrimary,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: AppTheme.bgCard,
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: AppTheme.borderSubtle),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => onNavClick('inquiry'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryBlue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Start Project',
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ] else ...[
                Row(
                  children: [
                    IconButton(
                      tooltip: 'Pinterest @adevictorolu',
                      onPressed: () => _launchUrl(PortfolioData.pinterestUrl),
                      icon: const Icon(Icons.push_pin_outlined, color: AppTheme.pinterestRed, size: 20),
                    ),
                    Builder(
                      builder: (scaffoldContext) {
                        return IconButton(
                          icon: const Icon(Icons.menu_rounded, color: AppTheme.textPrimary, size: 24),
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
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Text(
            widget.title,
            style: TextStyle(
              color: _isHovered ? Colors.white : AppTheme.textSecondary,
              fontSize: 14,
              fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
