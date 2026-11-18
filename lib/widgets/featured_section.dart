import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/project_item.dart';
import '../services/pinterest_service.dart';
import 'project_artwork_image.dart';
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
    final isDesktop = screenWidth >= 960;

    return Container(
      width: double.infinity,
      color: AppTheme.bgDark,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 48 : 24,
        vertical: 56,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1080),
          child: ValueListenableBuilder<List<ProjectItem>>(
            valueListenable: PinterestService.instance.projectsNotifier,
            builder: (context, projects, _) {
              final featuredProjects =
                  projects.where((p) => p.isFeatured).take(6).toList();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Featured',
                        style: TextStyle(
                          fontFamily: AppTheme.fontFamily,
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: -0.5,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: onViewAllProjects,
                        icon: const Icon(Icons.arrow_forward_rounded, size: 15),
                        label: const Text('All Work'),
                        style: TextButton.styleFrom(
                          foregroundColor: AppTheme.primaryBlueLight,
                          textStyle: const TextStyle(
                            fontFamily: AppTheme.fontFamily,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      int crossAxisCount = 1;
                      if (constraints.maxWidth >= 900) {
                        crossAxisCount = 3;
                      } else if (constraints.maxWidth >= 540) {
                        crossAxisCount = 2;
                      }

                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 22,
                          mainAxisSpacing: 22,
                          childAspectRatio: 0.84,
                        ),
                        itemCount: featuredProjects.length,
                        itemBuilder: (context, index) {
                          final project = featuredProjects[index];
                          return GestureDetector(
                            onTap: () => _openProjectModal(context, project),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppTheme.bgCard,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: AppTheme.borderSubtle),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ProjectArtworkImage(project: project),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 14,
                                    ),
                                    child: Text(
                                      project.title,
                                      style: const TextStyle(
                                        fontFamily: AppTheme.fontFamily,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                        letterSpacing: -0.2,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
