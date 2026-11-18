import 'package:flutter/material.dart';
import '../models/project_item.dart';
import '../theme/app_theme.dart';

class ProjectArtworkImage extends StatelessWidget {
  final ProjectItem project;
  final BoxFit fit;
  final Alignment alignment;

  const ProjectArtworkImage({
    super.key,
    required this.project,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.topCenter,
  });

  @override
  Widget build(BuildContext context) {
    if (project.isNetworkImage) {
      return Image.network(
        project.imagePath,
        fit: fit,
        alignment: alignment,
        width: double.infinity,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            color: AppTheme.bgElevated,
            child: const Center(
              child: SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppTheme.primaryBlueLight,
                ),
              ),
            ),
          );
        },
        errorBuilder: (_, _, _) => _buildFallback(),
      );
    }

    return Image.asset(
      project.imagePath,
      fit: fit,
      alignment: alignment,
      width: double.infinity,
      errorBuilder: (_, _, _) => _buildFallback(),
    );
  }

  Widget _buildFallback() {
    return Container(
      color: AppTheme.bgElevated,
      child: const Center(
        child: Icon(
          Icons.image_outlined,
          color: AppTheme.textMuted,
          size: 32,
        ),
      ),
    );
  }
}
