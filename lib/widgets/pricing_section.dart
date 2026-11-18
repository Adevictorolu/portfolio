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
  bool _isNgn = true;

  Future<void> _launchWhatsApp(String packageName, int price) async {
    final formattedPrice = PortfolioData.formatCurrency(price, _isNgn);
    final url = PortfolioData.buildWhatsAppUrl(
      service: packageName,
      budget: formattedPrice,
    );
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
        horizontal: isDesktop ? 40 : 20,
        vertical: 64,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Minimal Header + Currency Switch
              Wrap(
                spacing: 16,
                runSpacing: 12,
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Text(
                    'Pricing',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: -0.6,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: AppTheme.bgCard,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppTheme.borderSubtle),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _CurrencyTab(
                          label: 'NGN (₦)',
                          isSelected: _isNgn,
                          onTap: () => setState(() => _isNgn = true),
                        ),
                        _CurrencyTab(
                          label: 'USD (\$)',
                          isSelected: !_isNgn,
                          onTap: () => setState(() => _isNgn = false),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // Packages Grid
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 1;
                  double childAspectRatio = 1.05;
                  if (constraints.maxWidth >= 960) {
                    crossAxisCount = 4;
                    childAspectRatio = 0.78;
                  } else if (constraints.maxWidth >= 560) {
                    crossAxisCount = 2;
                    childAspectRatio = 0.85;
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18,
                      childAspectRatio: childAspectRatio,
                    ),
                    itemCount: PortfolioData.packages.length,
                    itemBuilder: (context, index) {
                      final pkg = PortfolioData.packages[index];
                      return _PackageCard(
                        pkg: pkg,
                        isNgn: _isNgn,
                        onSelect: () => _launchWhatsApp(
                          pkg.name,
                          _isNgn ? pkg.priceNgn : pkg.priceUsd,
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
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
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryBlue : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : AppTheme.textSecondary,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            fontSize: 12,
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

  const _PackageCard({
    required this.pkg,
    required this.isNgn,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final price = isNgn ? pkg.priceNgn : pkg.priceUsd;
    final formattedPrice = PortfolioData.formatCurrency(price, isNgn);

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.bgCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: pkg.isPopular ? AppTheme.primaryBlue : AppTheme.borderSubtle,
          width: pkg.isPopular ? 1.5 : 1.0,
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  pkg.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (pkg.badge != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryBlue.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    pkg.badge!,
                    style: const TextStyle(
                      color: AppTheme.primaryBlueLight,
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            formattedPrice,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 26,
              letterSpacing: -0.6,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            pkg.description,
            style: const TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 12,
              height: 1.35,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Divider(color: AppTheme.borderSubtle, height: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: pkg.features.take(4).map((f) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check_rounded,
                        size: 14,
                        color: AppTheme.primaryBlueLight,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          f,
                          style: const TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 12,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          ElevatedButton(
            onPressed: onSelect,
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  pkg.isPopular ? AppTheme.primaryBlue : AppTheme.bgElevated,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 40),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Select',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
