import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import '../models/service_item.dart';

class ServicesSection extends StatelessWidget {
  final Function(String serviceName) onRequestService;

  const ServicesSection({
    super.key,
    required this.onRequestService,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1100;
    final isTablet = screenWidth >= 700;

    return Container(
      width: double.infinity,
      color: AppTheme.bgDark,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 48 : (isTablet ? 32 : 20),
        vertical: 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Header
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.goldAccent.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'PROFESSIONAL CREATIVE CAPABILITIES',
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
                'Services & Strategic Solutions',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Tailored graphic design solutions that elevate corporate standing, drive ticket sales, and amplify ministry impact.',
                style: TextStyle(
                  fontSize: 15,
                  color: AppTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 48),

              // Responsive Service Cards Grid
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 1;
                  if (constraints.maxWidth >= 1024) {
                    crossAxisCount = 3;
                  } else if (constraints.maxWidth >= 640) {
                    crossAxisCount = 2;
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      childAspectRatio: 0.88,
                    ),
                    itemCount: PortfolioData.services.length,
                    itemBuilder: (context, index) {
                      final service = PortfolioData.services[index];
                      return _ServiceCard(
                        service: service,
                        onRequest: () => onRequestService(service.title),
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

class _ServiceCard extends StatefulWidget {
  final ServiceItem service;
  final VoidCallback onRequest;

  const _ServiceCard({
    required this.service,
    required this.onRequest,
  });

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final s = widget.service;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppTheme.bgCard,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: _hovered ? AppTheme.goldAccent.withValues(alpha: 0.5) : AppTheme.borderCard,
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: _hovered ? AppTheme.goldAccent.withValues(alpha: 0.1) : Colors.black.withValues(alpha: 0.2),
              blurRadius: _hovered ? 20 : 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon & Turnaround Badge Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryBlue.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppTheme.primaryBlue.withValues(alpha: 0.3)),
                  ),
                  child: Icon(s.iconData, color: AppTheme.primaryBlueLight, size: 24),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.bgElevated,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: AppTheme.borderSubtle),
                  ),
                  child: Text(
                    s.turnaround,
                    style: const TextStyle(
                      color: AppTheme.goldAccentLight,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),

            // Title
            Text(
              s.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),

            // Description
            Text(
              s.description,
              style: const TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 13,
                height: 1.5,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),

            // Deliverables checklist
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: s.deliverables.take(2).map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    children: [
                      const Icon(Icons.check, size: 14, color: AppTheme.primaryBlueLight),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          item,
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
            const SizedBox(height: 16),

            // Starting Rates & CTA
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Starting from:',
                      style: TextStyle(color: AppTheme.textMuted, fontSize: 10),
                    ),
                    Text(
                      '${PortfolioData.formatCurrency(s.startingNgn, true)} / ${PortfolioData.formatCurrency(s.startingUsd, false)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: widget.onRequest,
                  style: TextButton.styleFrom(
                    foregroundColor: AppTheme.goldAccentLight,
                    textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Book Service'),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_forward, size: 12),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
