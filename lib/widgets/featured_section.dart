import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/project_item.dart';
import '../data/portfolio_data.dart';
import 'project_detail_modal.dart';

class FeaturedSection extends StatelessWidget {
  final VoidCallback onStartProject;
  final VoidCallback onViewAllProjects;

  const FeaturedSection({
    super.key,
    required this.onStartProject,
    required this.onViewAllProjects,
  });

  void _openProjectModal(BuildContext context, ProjectItem project) {
    showDialog(
      context: context,
      builder: (context) => ProjectDetailModal(
        project: project,
        onStartProject: onStartProject,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1100;
    final isTablet = screenWidth >= 700;

    final featuredProjects = PortfolioData.projects.where((p) => p.isFeatured).toList();

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppTheme.goldAccent.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text(
                            'CURATED HIGHLIGHTS',
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
                          'Featured Work & Case Studies',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'A curated selection of high-impact visual campaigns, international event posters, and brand identities.',
                          style: TextStyle(
                            fontSize: 15,
                            color: AppTheme.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isTablet)
                    TextButton.icon(
                      onPressed: onViewAllProjects,
                      icon: const Icon(Icons.arrow_forward_rounded, size: 16),
                      label: const Text('View All Work'),
                      style: TextButton.styleFrom(
                        foregroundColor: AppTheme.goldAccentLight,
                        textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 48),

              // Responsive Grid of Featured Projects
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
                      mainAxisSpacing: 28,
                      childAspectRatio: 0.78,
                    ),
                    itemCount: featuredProjects.length,
                    itemBuilder: (context, index) {
                      final project = featuredProjects[index];
                      return _FeaturedCard(
                        project: project,
                        onTap: () => _openProjectModal(context, project),
                      );
                    },
                  );
                },
              ),

              const SizedBox(height: 48),
              Center(
                child: OutlinedButton.icon(
                  onPressed: onViewAllProjects,
                  icon: const Icon(Icons.apps_rounded, size: 18),
                  label: const Text('Explore Full Portfolio Gallery (50+ Designs)'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: AppTheme.borderCard, width: 1.5),
                    backgroundColor: AppTheme.bgCard,
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeaturedCard extends StatefulWidget {
  final ProjectItem project;
  final VoidCallback onTap;

  const _FeaturedCard({
    required this.project,
    required this.onTap,
  });

  @override
  State<_FeaturedCard> createState() => _FeaturedCardState();
}

class _FeaturedCardState extends State<_FeaturedCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(0.0, _isHovered ? -6.0 : 0.0, 0.0),
          decoration: BoxDecoration(
            color: AppTheme.bgCard,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: _isHovered ? AppTheme.goldAccent.withValues(alpha: 0.5) : AppTheme.borderCard,
              width: _isHovered ? 1.5 : 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered ? AppTheme.goldAccent.withValues(alpha: 0.15) : Colors.black.withValues(alpha: 0.2),
                blurRadius: _isHovered ? 24 : 12,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Artwork Presentation Area
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      widget.project.imagePath,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      errorBuilder: (_, _, _) => Container(
                        color: AppTheme.bgElevated,
                        child: const Center(
                          child: Icon(Icons.image, color: AppTheme.textMuted, size: 36),
                        ),
                      ),
                    ),
                    // Hover dark gradient with view case study prompt
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: _isHovered ? 1.0 : 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              AppTheme.bgDark.withValues(alpha: 0.85),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: AppTheme.primaryBlue,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: AppTheme.primaryBlue.withValues(alpha: 0.4),
                                  blurRadius: 12,
                                ),
                              ],
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.visibility_rounded, size: 16, color: Colors.white),
                                SizedBox(width: 6),
                                Text(
                                  'View Case Study',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Top Category Pill
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppTheme.bgDark.withValues(alpha: 0.88),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AppTheme.borderSubtle),
                        ),
                        child: Text(
                          widget.project.category,
                          style: const TextStyle(
                            color: AppTheme.goldAccentLight,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Project Info Card Footer
              Container(
                padding: const EdgeInsets.all(16),
                color: AppTheme.bgCard,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        height: 1.3,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.project.client,
                      style: const TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
}
