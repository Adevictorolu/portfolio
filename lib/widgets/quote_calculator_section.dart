import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';

class QuoteCalculatorSection extends StatefulWidget {
  final VoidCallback onRequestFinalQuote;

  const QuoteCalculatorSection({
    super.key,
    required this.onRequestFinalQuote,
  });

  @override
  State<QuoteCalculatorSection> createState() => _QuoteCalculatorSectionState();
}

class _QuoteCalculatorSectionState extends State<QuoteCalculatorSection> {
  String _projectType = 'Event Flyer';
  final bool _isNigeria = true;
  final int _quantity = 1;
  final String _deadline = 'Standard';

  final List<String> _projectTypes = [
    'Event Flyer',
    'Church & Ministry',
    'Brand Identity',
    'Social Media',
    'Corporate',
    'Book Cover',
  ];

  Map<String, int> _calculateEstimate() {
    int baseNgn = 15000;
    int baseUsd = 45;

    switch (_projectType) {
      case 'Brand Identity':
        baseNgn = 100000;
        baseUsd = 300;
        break;
      case 'Book Cover':
        baseNgn = 25000;
        baseUsd = 75;
        break;
      case 'Corporate':
        baseNgn = 20000;
        baseUsd = 60;
        break;
      case 'Social Media':
        baseNgn = 10000;
        baseUsd = 35;
        break;
    }

    double qtyFactor = _quantity == 1 ? 1.0 : 1.0 + (_quantity - 1) * 0.75;
    double urgencyMult = _deadline == 'Urgent (24h)' ? 1.3 : 1.0;

    int minVal = ((_isNigeria ? baseNgn : baseUsd) * qtyFactor * urgencyMult).round();
    int maxVal = (minVal * 1.25).round();
    return {'min': minVal, 'max': maxVal};
  }

  Future<void> _sendEstimateToWhatsApp() async {
    final est = _calculateEstimate();
    final minStr = PortfolioData.formatCurrency(est['min']!, _isNigeria);
    final maxStr = PortfolioData.formatCurrency(est['max']!, _isNigeria);
    final url = PortfolioData.buildWhatsAppUrl(
      service: _projectType,
      budget: '$minStr – $maxStr',
      deadline: _deadline,
      notes: 'Quantity: $_quantity',
    );
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final est = _calculateEstimate();
    final minStr = PortfolioData.formatCurrency(est['min']!, _isNigeria);
    final maxStr = PortfolioData.formatCurrency(est['max']!, _isNigeria);

    return Container(
      width: double.infinity,
      color: AppTheme.bgDark,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppTheme.bgCard,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppTheme.borderSubtle),
            ),
            child: Wrap(
              spacing: 24,
              runSpacing: 20,
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _projectTypes.map((type) {
                    final isSel = _projectType == type;
                    return ChoiceChip(
                      label: Text(type),
                      selected: isSel,
                      onSelected: (_) => setState(() => _projectType = type),
                      backgroundColor: AppTheme.bgSurface,
                      selectedColor: AppTheme.primaryBlue,
                      labelStyle: TextStyle(
                        color: isSel ? Colors.white : AppTheme.textSecondary,
                        fontSize: 12,
                        fontWeight: isSel ? FontWeight.w700 : FontWeight.w500,
                      ),
                      side: BorderSide(
                        color: isSel ? AppTheme.primaryBlue : AppTheme.borderSubtle,
                      ),
                      showCheckmark: false,
                    );
                  }).toList(),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$minStr – $maxStr',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: _sendEstimateToWhatsApp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.whatsappGreen,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Get Quote'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
