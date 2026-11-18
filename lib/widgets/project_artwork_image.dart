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

  /// Wraps remote Pinterest CDN URLs in a CORS-safe image proxy so Flutter Web
  /// CanvasKit/Skwasm can decode pixels without cross-origin errors.
  String _corsSafeUrl(String rawUrl) {
    if (rawUrl.contains('pinimg.com') && !rawUrl.contains('wsrv.nl')) {
      return 'https://wsrv.nl/?url=${Uri.encodeComponent(rawUrl)}&w=736&output=jpg';
    }
    return rawUrl;
  }

  @override
  Widget build(BuildContext context) {
    if (project.isNetworkImage) {
      final primaryUrl = _corsSafeUrl(project.imagePath);
      final fallbackProxyUrl =
          'https://corsproxy.io/?${Uri.encodeComponent(project.imagePath)}';

      return Image.network(
        primaryUrl,
        fit: fit,
        alignment: alignment,
        width: double.infinity,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return _buildLoading();
        },
        errorBuilder: (_, _, _) {
          return Image.network(
            fallbackProxyUrl,
            fit: fit,
            alignment: alignment,
            width: double.infinity,
            errorBuilder: (_, _, _) => _buildFallback(),
          );
        },
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

  Widget _buildLoading() {
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
