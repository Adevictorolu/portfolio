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
  bool _isNigeria = true;
  String _complexity = 'Standard';
  int _quantity = 1;
  String _deadline = '3–5 days';

  // Add-ons
  bool _addSourceFiles = false;
  bool _addMultipleSizes = true;
  bool _addSocialAdaptations = false;
  bool _addPrintReady = true;

  final List<String> _projectTypes = [
    'Event Flyer',
    'Church/Ministry',
    'Brand Identity',
    'Social Media Design',
    'Corporate Graphics',
    'Book Cover',
    'Celebration / Birthday',
    'Digital Advertisement',
  ];

  final List<String> _complexityOptions = ['Basic', 'Standard', 'Premium'];
  final List<String> _deadlineOptions = ['3–5 days', '1–2 weeks', 'Urgent (24–48 hrs)'];

  // Calculate dynamic price range
  Map<String, int> _calculateEstimate() {
    // Base price in NGN and USD
    int baseNgn = 15000;
    int baseUsd = 45;

    switch (_projectType) {
      case 'Brand Identity':
        baseNgn = 120000;
        baseUsd = 350;
        break;
      case 'Book Cover':
        baseNgn = 30000;
        baseUsd = 85;
        break;
      case 'Corporate Graphics':
        baseNgn = 25000;
        baseUsd = 70;
        break;
      case 'Church/Ministry':
        baseNgn = 15000;
        baseUsd = 50;
        break;
      case 'Event Flyer':
        baseNgn = 15000;
        baseUsd = 45;
        break;
      case 'Celebration / Birthday':
        baseNgn = 15000;
        baseUsd = 45;
        break;
      case 'Social Media Design':
        baseNgn = 12000;
        baseUsd = 35;
        break;
      default:
        baseNgn = 15000;
        baseUsd = 45;
    }

    // Complexity multiplier
    double compMult = 1.0;
    if (_complexity == 'Basic') compMult = 0.8;
    if (_complexity == 'Premium') compMult = 1.4;

    // Quantity scaling
    double qtyFactor = _quantity.toDouble();
    if (_quantity > 1) {
      qtyFactor = 1.0 + (_quantity - 1) * 0.75; // discount on extra designs
    }

    // Deadline urgency multiplier
    double urgencyMult = 1.0;
    if (_deadline == 'Urgent (24–48 hrs)') urgencyMult = 1.35;

    int totalNgn = ((baseNgn * compMult * qtyFactor * urgencyMult)).round();
    int totalUsd = ((baseUsd * compMult * qtyFactor * urgencyMult)).round();

    // Add-on fees
    if (_addSourceFiles) {
      totalNgn += 10000;
      totalUsd += 30;
    }
    if (_addMultipleSizes) {
      totalNgn += 8000;
      totalUsd += 20;
    }
    if (_addSocialAdaptations) {
      totalNgn += 12000;
      totalUsd += 35;
    }
    if (_addPrintReady) {
      totalNgn += 5000;
      totalUsd += 15;
    }

    // High end of range (+25%)
    int minVal = _isNigeria ? totalNgn : totalUsd;
    int maxVal = (minVal * 1.3).round();

    return {'min': minVal, 'max': maxVal};
  }

  Future<void> _sendEstimateToWhatsApp() async {
    final est = _calculateEstimate();
    final formattedMin = PortfolioData.formatCurrency(est['min']!, _isNigeria);
    final formattedMax = PortfolioData.formatCurrency(est['max']!, _isNigeria);
    final budgetStr = '$formattedMin – $formattedMax';

    final addons = <String>[];
    if (_addSourceFiles) addons.add('Source Files');
    if (_addMultipleSizes) addons.add('Multiple Sizes');
    if (_addSocialAdaptations) addons.add('Social Adaptations');
    if (_addPrintReady) addons.add('Print-Ready Specs');

    final notes = 'Complexity: $_complexity | Qty: $_quantity | Deadline: $_deadline | Add-ons: ${addons.isEmpty ? 'None' : addons.join(', ')}';

    final url = PortfolioData.buildWhatsAppUrl(
      service: _projectType,
      budget: budgetStr,
      deadline: _deadline,
      notes: notes,
    );

    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final estimate = _calculateEstimate();

    final formattedMin = PortfolioData.formatCurrency(estimate['min']!, _isNigeria);
    final formattedMax = PortfolioData.formatCurrency(estimate['max']!, _isNigeria);

    return Container(
      width: double.infinity,
      color: AppTheme.bgDark,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 48 : 20,
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
                  color: AppTheme.primaryBlue.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'INTERACTIVE PRICE ESTIMATOR',
                  style: TextStyle(
                    color: AppTheme.primaryBlueLight,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Instant Custom Project Quote',
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
                'Configure your project specifications and calculate an immediate starting investment estimate.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: AppTheme.textSecondary),
              ),
              const SizedBox(height: 48),

              // Calculator Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: AppTheme.bgCard,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppTheme.borderCard, width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.4),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: isDesktop
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: 12, child: _buildCalculatorInputs()),
                          const SizedBox(width: 48),
                          Expanded(flex: 8, child: _buildEstimateResult(formattedMin, formattedMax)),
                        ],
                      )
                    : Column(
                        children: [
                          _buildCalculatorInputs(),
                          const SizedBox(height: 40),
                          _buildEstimateResult(formattedMin, formattedMax),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalculatorInputs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. Client Location / Currency
        const Text('1. Client Location', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14)),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _ChoicePill(
                label: '🇳🇬 Nigeria (NGN ₦)',
                isSelected: _isNigeria,
                onTap: () => setState(() => _isNigeria = true),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _ChoicePill(
                label: '🌐 International (USD \$)',
                isSelected: !_isNigeria,
                onTap: () => setState(() => _isNigeria = false),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // 2. Project Type
        const Text('2. Project Type', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14)),
        const SizedBox(height: 10),
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
              side: BorderSide(color: isSel ? AppTheme.primaryBlue : AppTheme.borderSubtle),
            );
          }).toList(),
        ),
        const SizedBox(height: 24),

        // 3. Project Complexity & Quantity
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Complexity
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('3. Complexity', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14)),
                  const SizedBox(height: 10),
                  Row(
                    children: _complexityOptions.map((comp) {
                      final isSel = _complexity == comp;
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: _ChoicePill(
                            label: comp,
                            isSelected: isSel,
                            onTap: () => setState(() => _complexity = comp),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // Quantity
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('4. Number of Designs', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14)),
                  const SizedBox(height: 10),
                  Row(
                    children: [1, 2, 3, 5].map((q) {
                      final isSel = _quantity == q;
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: _ChoicePill(
                            label: '$q',
                            isSelected: isSel,
                            onTap: () => setState(() => _quantity = q),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // 5. Target Deadline
        const Text('5. Target Deadline', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14)),
        const SizedBox(height: 10),
        Row(
          children: _deadlineOptions.map((dl) {
            final isSel = _deadline == dl;
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: _ChoicePill(
                  label: dl,
                  isSelected: isSel,
                  onTap: () => setState(() => _deadline = dl),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 24),

        // 6. Additional Add-ons
        const Text('6. Additional Services', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14)),
        const SizedBox(height: 10),
        Wrap(
          spacing: 12,
          runSpacing: 10,
          children: [
            _AddonCheckbox(
              label: 'Source Files (AI / PSD)',
              isChecked: _addSourceFiles,
              onChanged: (val) => setState(() => _addSourceFiles = val),
            ),
            _AddonCheckbox(
              label: 'Multiple Formats (1:1, 9:16)',
              isChecked: _addMultipleSizes,
              onChanged: (val) => setState(() => _addMultipleSizes = val),
            ),
            _AddonCheckbox(
              label: 'Print-Ready Specs & Bleeds',
              isChecked: _addPrintReady,
              onChanged: (val) => setState(() => _addPrintReady = val),
            ),
            _AddonCheckbox(
              label: 'Social Carousel Adaptations',
              isChecked: _addSocialAdaptations,
              onChanged: (val) => setState(() => _addSocialAdaptations = val),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEstimateResult(String minStr, String maxStr) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppTheme.bgSurface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.goldAccent.withValues(alpha: 0.4)),
        boxShadow: [
          BoxShadow(
            color: AppTheme.goldAccent.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppTheme.goldAccent.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              'ESTIMATED PROJECT RANGE',
              style: TextStyle(
                color: AppTheme.goldAccentLight,
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.6,
              ),
            ),
          ),
          const SizedBox(height: 18),

          Text(
            '$minStr – $maxStr',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 32,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),

          const Text(
            'Estimated guidance range, not a rigid final invoice.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.textMuted,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 24),

          // Specs summary box
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppTheme.bgCard,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.borderSubtle),
            ),
            child: Column(
              children: [
                _buildSummaryRow('Service', _projectType),
                const SizedBox(height: 6),
                _buildSummaryRow('Complexity', _complexity),
                const SizedBox(height: 6),
                _buildSummaryRow('Quantity', '$_quantity design${_quantity > 1 ? 's' : ''}'),
                const SizedBox(height: 6),
                _buildSummaryRow('Timeline', _deadline),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // CTAs
          ElevatedButton.icon(
            onPressed: _sendEstimateToWhatsApp,
            icon: const Icon(Icons.chat_bubble_outline, size: 16),
            label: const Text('Send Estimate via WhatsApp'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.whatsappGreen,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 46),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
            ),
          ),
          const SizedBox(height: 10),
          OutlinedButton(
            onPressed: widget.onRequestFinalQuote,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: AppTheme.borderCard),
              minimumSize: const Size(double.infinity, 44),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Request Formal Written Quote', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: AppTheme.textMuted, fontSize: 12)),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class _ChoicePill extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _ChoicePill({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryBlue : AppTheme.bgSurface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? AppTheme.primaryBlue : AppTheme.borderSubtle,
          ),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : AppTheme.textSecondary,
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _AddonCheckbox extends StatelessWidget {
  final String label;
  final bool isChecked;
  final Function(bool) onChanged;

  const _AddonCheckbox({
    required this.label,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!isChecked),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isChecked ? AppTheme.primaryBlue.withValues(alpha: 0.12) : AppTheme.bgSurface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isChecked ? AppTheme.primaryBlue : AppTheme.borderSubtle,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isChecked ? Icons.check_box : Icons.check_box_outline_blank,
              size: 16,
              color: isChecked ? AppTheme.primaryBlueLight : AppTheme.textMuted,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isChecked ? Colors.white : AppTheme.textSecondary,
                fontSize: 12,
                fontWeight: isChecked ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
