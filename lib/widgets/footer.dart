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
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppTheme.bgDark,
        border: Border(top: BorderSide(color: AppTheme.borderSubtle, width: 1)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Wrap(
            spacing: 24,
            runSpacing: 20,
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/logo/avomedia_badge.png',
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '© ${DateTime.now().year} ${PortfolioData.brandName}',
                    style: const TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Wrap(
                spacing: 18,
                runSpacing: 10,
                children: [
                  _FooterLink(
                    label: 'Pinterest',
                    onTap: () => _launchUrl(PortfolioData.pinterestUrl),
                  ),
                  _FooterLink(
                    label: 'Instagram',
                    onTap: () => _launchUrl(PortfolioData.instagramPersonalUrl),
                  ),
                  _FooterLink(
                    label: 'Behance',
                    onTap: () => _launchUrl(PortfolioData.behanceUrl),
                  ),
                  _FooterLink(
                    label: 'WhatsApp',
                    onTap: () => _launchUrl(PortfolioData.buildWhatsAppUrl()),
                  ),
                  _FooterLink(
                    label: 'Email',
                    onTap: () => _launchUrl('mailto:${PortfolioData.email}'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _FooterLink({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        label,
        style: const TextStyle(
          color: AppTheme.textSecondary,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
