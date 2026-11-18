import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MetricsStrip extends StatelessWidget {
  const MetricsStrip({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 768;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppTheme.bgSurface,
        border: Border.symmetric(
          horizontal: BorderSide(color: AppTheme.borderSubtle, width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isDesktop
              ? const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _MetricItem(number: '500+', label: 'Projects'),
                    _MetricItem(number: '100%', label: 'Satisfaction'),
                    _MetricItem(number: '24–48h', label: 'Turnaround'),
                    _MetricItem(number: 'Live', label: 'Pinterest Sync'),
                  ],
                )
              : const Wrap(
                  spacing: 32,
                  runSpacing: 20,
                  alignment: WrapAlignment.spaceAround,
                  children: [
                    _MetricItem(number: '500+', label: 'Projects'),
                    _MetricItem(number: '100%', label: 'Satisfaction'),
                    _MetricItem(number: '24–48h', label: 'Turnaround'),
                    _MetricItem(number: 'Live', label: 'Pinterest Sync'),
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

  const _MetricItem({
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppTheme.textSecondary,
          ),
        ),
      ],
    );
  }
}
