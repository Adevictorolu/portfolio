import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProcessSection extends StatelessWidget {
  const ProcessSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 640;

    final steps = [
      const _ProcessStep(
        number: '01',
        title: 'Project Brief',
        description: 'Share your project goals, content, references, target audience, and preferred deadline through the inquiry form or WhatsApp.',
        icon: Icons.edit_note_rounded,
      ),
      const _ProcessStep(
        number: '02',
        title: 'Scope & Direction',
        description: 'We align on visual direction, dimensions, concepts, timeline, and investment. A clear scope guarantees smooth execution.',
        icon: Icons.chat_bubble_outline_rounded,
      ),
      const _ProcessStep(
        number: '03',
        title: 'Design & Refinement',
        description: 'I craft initial concepts with strategic typography and color balance, then refine details based on your feedback.',
        icon: Icons.palette_outlined,
      ),
      const _ProcessStep(
        number: '04',
        title: 'Final Delivery',
        description: 'All approved assets are exported in 300 DPI print-ready PDFs, mobile-optimized formats, and source files where requested.',
        icon: Icons.task_alt_rounded,
      ),
    ];

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
                  'STREAMLINED WORKFLOW',
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
                'How We Bring Your Vision to Life',
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
                'A transparent, reliable 4-step creative process designed for speed, clarity, and exceptional quality.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: AppTheme.textSecondary),
              ),
              const SizedBox(height: 48),

              // Steps Grid
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 1;
                  if (constraints.maxWidth >= 1024) {
                    crossAxisCount = 4;
                  } else if (constraints.maxWidth >= 600) {
                    crossAxisCount = 2;
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.88,
                    ),
                    itemCount: steps.length,
                    itemBuilder: (context, index) {
                      return steps[index];
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

class _ProcessStep extends StatelessWidget {
  final String number;
  final String title;
  final String description;
  final IconData icon;

  const _ProcessStep({
    required this.number,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.bgCard,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppTheme.borderCard),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppTheme.primaryBlue.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: AppTheme.primaryBlueLight, size: 22),
              ),
              Text(
                number,
                style: const TextStyle(
                  color: AppTheme.goldAccentLight,
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 13,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
