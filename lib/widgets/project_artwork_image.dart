import 'package:flutter/material.dart';
import '../models/project_item.dart';
import '../theme/app_theme.dart';

class ProjectArtworkImage extends StatelessWidget {
  final ProjectItem project;
  final BoxFit fit;
  final Alignment alignment;
  final int? cacheWidth;

  const ProjectArtworkImage({
    super.key,
    required this.project,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.topCenter,
    this.cacheWidth = 560,
  });

  /// Wraps remote Pinterest CDN URLs in a fast CORS-safe image proxy so Flutter Web
  /// CanvasKit/Skwasm can decode pixels without cross-origin errors.
  String _corsSafeUrl(String rawUrl) {
    if (rawUrl.contains('pinimg.com') && !rawUrl.contains('wsrv.nl')) {
      return 'https://wsrv.nl/?url=${Uri.encodeComponent(rawUrl)}&w=640&q=80&output=webp';
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
        cacheWidth: cacheWidth,
        gaplessPlayback: true,
        filterQuality: FilterQuality.medium,
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
            cacheWidth: cacheWidth,
            gaplessPlayback: true,
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
      cacheWidth: cacheWidth,
      gaplessPlayback: true,
      filterQuality: FilterQuality.medium,
      errorBuilder: (_, _, _) => _buildFallback(),
    );
  }

  Widget _buildLoading() {
    return Container(
      color: AppTheme.bgElevated,
      child: const Center(
        child: SizedBox(
          width: 20,
          height: 20,
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
