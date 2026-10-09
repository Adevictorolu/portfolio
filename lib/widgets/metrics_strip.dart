import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MetricsStrip extends StatelessWidget {
  const MetricsStrip({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 640;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppTheme.bgSurface,
        border: Border.symmetric(
          horizontal: BorderSide(color: AppTheme.borderSubtle, width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: isDesktop
              ? const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _MetricItem(
                      number: '500+',
                      label: 'Projects Delivered',
                      sublabel: 'Across Nigeria, USA, UK & Global',
                    ),
                    _VerticalDivider(),
                    _MetricItem(
                      number: '100%',
                      label: 'Client Satisfaction',
                      sublabel: 'Precision execution & attention to detail',
                    ),
                    _VerticalDivider(),
                    _MetricItem(
                      number: '24–48h',
                      label: 'Priority Turnaround',
                      sublabel: 'Rapid delivery for time-sensitive events',
                    ),
                    _VerticalDivider(),
                    _MetricItem(
                      number: '8+',
                      label: 'Design Disciplines',
                      sublabel: 'Branding, flyers, ministry, corporate, covers',
                    ),
                  ],
                )
              : Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  alignment: WrapAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: isTablet ? screenWidth * 0.42 : screenWidth * 0.85,
                      child: const _MetricItem(
                        number: '500+',
                        label: 'Projects Delivered',
                        sublabel: 'Across Nigeria, USA, UK & Global',
                      ),
                    ),
                    SizedBox(
                      width: isTablet ? screenWidth * 0.42 : screenWidth * 0.85,
                      child: const _MetricItem(
                        number: '100%',
                        label: 'Client Satisfaction',
                        sublabel: 'Precision execution & attention to detail',
                      ),
                    ),
                    SizedBox(
                      width: isTablet ? screenWidth * 0.42 : screenWidth * 0.85,
                      child: const _MetricItem(
                        number: '24–48h',
                        label: 'Priority Turnaround',
                        sublabel: 'Rapid delivery for time-sensitive events',
                      ),
                    ),
                    SizedBox(
                      width: isTablet ? screenWidth * 0.42 : screenWidth * 0.85,
                      child: const _MetricItem(
                        number: '8+',
                        label: 'Design Disciplines',
                        sublabel: 'Branding, flyers, ministry, corporate, covers',
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _MetricItem extends StatelessWidget {
  final String number;
  final String label;
  final String sublabel;

  const _MetricItem({
    required this.number,
    required this.label,
    required this.sublabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w900,
            color: AppTheme.goldAccentLight,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppTheme.textPrimary,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          sublabel,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12,
            color: AppTheme.textMuted,
          ),
        ),
      ],
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 1,
      color: AppTheme.borderSubtle,
    );
  }
}
