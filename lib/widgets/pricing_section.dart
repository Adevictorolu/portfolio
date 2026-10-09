import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import '../models/package_item.dart';

class PricingSection extends StatefulWidget {
  final Function(String packageName) onSelectPackage;

  const PricingSection({
    super.key,
    required this.onSelectPackage,
  });

  @override
  State<PricingSection> createState() => _PricingSectionState();
}

class _PricingSectionState extends State<PricingSection> {
  bool _isNgn = true; // Currency toggle: true for NGN, false for USD

  Future<void> _launchWhatsApp(String packageName, int price) async {
    final formattedPrice = PortfolioData.formatCurrency(price, _isNgn);
    final url = PortfolioData.buildWhatsAppUrl(
      service: packageName,
      budget: formattedPrice,
      notes: 'I am interested in ordering the $packageName ($formattedPrice).',
    );
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1100;
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.goldAccent.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'TRANSPARENT VALUE & INVESTMENT',
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
                'Commercial Packages & Starting Rates',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Fair, professional pricing tailored for both Nigerian organizations and international clientele.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: AppTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 32),

              // Currency Toggle Pill Switch
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppTheme.bgCard,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppTheme.borderSubtle),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _CurrencyTab(
                      label: '🇳🇬 Nigerian Naira (NGN ₦)',
                      isSelected: _isNgn,
                      onTap: () => setState(() => _isNgn = true),
                    ),
                    _CurrencyTab(
                      label: '🌐 International (USD \$)',
                      isSelected: !_isNgn,
                      onTap: () => setState(() => _isNgn = false),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),

              // Packages Grid
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 1;
                  if (constraints.maxWidth >= 1024) {
                    crossAxisCount = 4;
                  } else if (constraints.maxWidth >= 640) {
                    crossAxisCount = 2;
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.64,
                    ),
                    itemCount: PortfolioData.packages.length,
                    itemBuilder: (context, index) {
                      final pkg = PortfolioData.packages[index];
                      return _PackageCard(
                        pkg: pkg,
                        isNgn: _isNgn,
                        onSelect: () => widget.onSelectPackage(pkg.name),
                        onWhatsApp: () => _launchWhatsApp(
                          pkg.name,
                          _isNgn ? pkg.priceNgn : pkg.priceUsd,
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 56),

              // Individual Starting Price Reference Table
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: AppTheme.bgCard,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppTheme.borderCard),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.tune_rounded, color: AppTheme.goldAccentLight, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'A La Carte Starting Rates (Individual Services)',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final isSmall = constraints.maxWidth < 640;
                        return Wrap(
                          spacing: 16,
                          runSpacing: 12,
                          children: [
                            _buildRateItem('Basic / Event Flyer', _isNgn ? '₦15,000 – ₦25,000' : '\$45 – \$75', isSmall),
                            _buildRateItem('VIP Event Campaign', _isNgn ? '₦30,000 – ₦50,000' : '\$80 – \$140', isSmall),
                            _buildRateItem('Social Media Design (Single)', _isNgn ? '₦10,000 – ₦18,000' : '\$35 – \$60', isSmall),
                            _buildRateItem('Church / Ministry Graphic', _isNgn ? '₦15,000 – ₦35,000' : '\$50 – \$100', isSmall),
                            _buildRateItem('Business Promotional Design', _isNgn ? '₦20,000 – ₦45,000' : '\$60 – \$120', isSmall),
                            _buildRateItem('Book / Publication Cover', _isNgn ? '₦25,000 – ₦75,000' : '\$75 – \$250', isSmall),
                            _buildRateItem('Logo Design (Stand-alone)', _isNgn ? '₦40,000 – ₦100,000' : '\$120 – \$300', isSmall),
                            _buildRateItem('Full Brand Identity System', _isNgn ? '₦200,000 – ₦600,000+' : '\$500 – \$1,800+', isSmall),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppTheme.bgElevated,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.info_outline, size: 16, color: AppTheme.textMuted),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Starting reference ranges only. Final investment depends on project scope, complexity, number of concepts, deliverables, and turnaround urgency.',
                              style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRateItem(String label, String range, bool isSmall) {
    return Container(
      width: isSmall ? double.infinity : 280,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppTheme.bgSurface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.borderSubtle),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: AppTheme.textSecondary, fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            range,
            style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class _CurrencyTab extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _CurrencyTab({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryBlue : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : AppTheme.textSecondary,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}

class _PackageCard extends StatelessWidget {
  final PackageItem pkg;
  final bool isNgn;
  final VoidCallback onSelect;
  final VoidCallback onWhatsApp;

  const _PackageCard({
    required this.pkg,
    required this.isNgn,
    required this.onSelect,
    required this.onWhatsApp,
  });

  @override
  Widget build(BuildContext context) {
    final price = isNgn ? pkg.priceNgn : pkg.priceUsd;
    final formattedPrice = PortfolioData.formatCurrency(price, isNgn);

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.bgCard,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: pkg.isPopular ? AppTheme.goldAccent : AppTheme.borderCard,
          width: pkg.isPopular ? 1.8 : 1.0,
        ),
        boxShadow: [
          if (pkg.isPopular)
            BoxShadow(
              color: AppTheme.goldAccent.withValues(alpha: 0.12),
              blurRadius: 24,
              offset: const Offset(0, 6),
            ),
        ],
      ),
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Badge
          if (pkg.badge != null)
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppTheme.goldAccent.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: AppTheme.goldAccent.withValues(alpha: 0.4)),
              ),
              child: Text(
                pkg.badge!.toUpperCase(),
                style: const TextStyle(
                  color: AppTheme.goldAccentLight,
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                  letterSpacing: 0.6,
                ),
              ),
            )
          else
            const SizedBox(height: 25),

          // Name
          Text(
            pkg.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            pkg.targetAudience,
            style: const TextStyle(
              color: AppTheme.textMuted,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 16),

          // Price display
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                formattedPrice,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 28,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(width: 4),
              const Text(
                'starting',
                style: TextStyle(
                  color: AppTheme.textMuted,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            pkg.description,
            style: const TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 12,
              height: 1.4,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Divider(color: AppTheme.borderSubtle, height: 28),

          // Features
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: pkg.features.map((f) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.check, size: 14, color: AppTheme.primaryBlueLight),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          f,
                          style: const TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 12),

          // Action Buttons
          ElevatedButton(
            onPressed: onSelect,
            style: ElevatedButton.styleFrom(
              backgroundColor: pkg.isPopular ? AppTheme.goldAccent : AppTheme.primaryBlue,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 42),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 0,
            ),
            child: const Text('Choose Package', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: onWhatsApp,
            style: OutlinedButton.styleFrom(
              foregroundColor: AppTheme.whatsappGreen,
              side: BorderSide(color: AppTheme.whatsappGreen.withValues(alpha: 0.3)),
              minimumSize: const Size(double.infinity, 38),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.chat_bubble_outline, size: 14, color: AppTheme.whatsappGreen),
                SizedBox(width: 6),
                Text('Order on WhatsApp', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
