import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../models/project_item.dart';
import '../data/portfolio_data.dart';
import '../services/pinterest_service.dart';
import 'project_artwork_image.dart';
import 'project_detail_modal.dart';

class PortfolioGallerySection extends StatefulWidget {
  final VoidCallback onStartProject;

  const PortfolioGallerySection({
    super.key,
    required this.onStartProject,
  });

  @override
  State<PortfolioGallerySection> createState() => _PortfolioGallerySectionState();
}

class _PortfolioGallerySectionState extends State<PortfolioGallerySection> {
  String _selectedCategory = 'All';
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  final List<String> _categories = [
    'All',
    'Pinterest',
    'Branding',
    'Church & Ministry',
    'Event Flyers',
    'Corporate',
    'Celebrations',
    'Book Covers',
    'Social Media',
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _openProject(ProjectItem project) {
    showDialog(
      context: context,
      builder: (context) => ProjectDetailModal(
        project: project,
        onStartProject: widget.onStartProject,
      ),
    );
  }

  Future<void> _launchPinterest() async {
    final uri = Uri.parse(PortfolioData.pinterestUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
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
        vertical: 64,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1080),
          child: ValueListenableBuilder<List<ProjectItem>>(
            valueListenable: PinterestService.instance.projectsNotifier,
            builder: (context, allProjects, _) {
              final filteredProjects = allProjects.where((project) {
                final matchesCategory = _selectedCategory == 'All' ||
                    (_selectedCategory == 'Pinterest' && project.isFromPinterest) ||
                    project.category == _selectedCategory;
                final query = _searchQuery.toLowerCase().trim();
                final matchesSearch = query.isEmpty ||
                    project.title.toLowerCase().contains(query) ||
                    project.category.toLowerCase().contains(query);
                return matchesCategory && matchesSearch;
              }).toList();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Minimal Header + Background Pinterest Auto-Sync Indicator
                  Wrap(
                    spacing: 16,
                    runSpacing: 12,
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Text(
                        'Selected Works',
                        style: TextStyle(
                          fontFamily: AppTheme.fontFamily,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: -0.6,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ValueListenableBuilder<bool>(
                            valueListenable: PinterestService.instance.isSyncingNotifier,
                            builder: (context, isSyncing, _) {
                              return OutlinedButton.icon(
                                onPressed: isSyncing
                                    ? null
                                    : () => PinterestService.instance.syncNow(),
                                icon: Image.asset(
                                  'assets/logo/pinterest_logo.png',
                                  width: 15,
                                  height: 15,
                                ),
                                label: Text(
                                  isSyncing ? 'Updating...' : 'Background Sync Active',
                                  style: const TextStyle(
                                    fontFamily: AppTheme.fontFamily,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  side: const BorderSide(color: AppTheme.borderSubtle),
                                  backgroundColor: AppTheme.bgCard,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 10,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 8),
                          TextButton.icon(
                            onPressed: _launchPinterest,
                            icon: const Icon(
                              Icons.open_in_new_rounded,
                              size: 14,
                              color: AppTheme.textSecondary,
                            ),
                            label: const Text(
                              '@adevictorolu',
                              style: TextStyle(
                                fontFamily: AppTheme.fontFamily,
                                color: AppTheme.textSecondary,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Category Filter Chips & Compact Search
                  Row(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: _categories.map((cat) {
                              final isSelected = _selectedCategory == cat;
                              return Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: ChoiceChip(
                                  avatar: cat == 'Pinterest'
                                      ? Image.asset(
                                          'assets/logo/pinterest_logo.png',
                                          width: 14,
                                          height: 14,
                                        )
                                      : null,
                                  label: Text(cat),
                                  selected: isSelected,
                                  onSelected: (_) =>
                                      setState(() => _selectedCategory = cat),
                                  backgroundColor: AppTheme.bgCard,
                                  selectedColor: AppTheme.primaryBlue,
                                  labelStyle: TextStyle(
                                    fontFamily: AppTheme.fontFamily,
                                    color: isSelected
                                        ? Colors.white
                                        : AppTheme.textSecondary,
                                    fontWeight: isSelected
                                        ? FontWeight.w700
                                        : FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                  side: BorderSide(
                                    color: isSelected
                                        ? AppTheme.primaryBlue
                                        : AppTheme.borderSubtle,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  showCheckmark: false,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      if (isDesktop) ...[
                        const SizedBox(width: 16),
                        SizedBox(
                          width: 220,
                          height: 38,
                          child: TextField(
                            controller: _searchController,
                            onChanged: (val) => setState(() => _searchQuery = val),
                            style: const TextStyle(
                              fontFamily: AppTheme.fontFamily,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Search work...',
                              hintStyle: const TextStyle(
                                fontFamily: AppTheme.fontFamily,
                                color: AppTheme.textMuted,
                                fontSize: 12,
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: AppTheme.textMuted,
                                size: 16,
                              ),
                              filled: true,
                              fillColor: AppTheme.bgCard,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: AppTheme.borderSubtle),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: AppTheme.borderSubtle),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: AppTheme.primaryBlue),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 28),

                  // Portfolio Grid
                  if (filteredProjects.isEmpty)
                    Container(
                      padding: const EdgeInsets.all(40),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppTheme.bgCard,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: AppTheme.borderSubtle),
                      ),
                      child: Column(
                        children: [
                          Text(
                            _selectedCategory == 'Pinterest'
                                ? 'Tracking @adevictorolu on Pinterest — new uploads appear here automatically.'
                                : 'No matching works found.',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: AppTheme.fontFamily,
                              color: AppTheme.textSecondary,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextButton(
                            onPressed: () {
                              _searchController.clear();
                              setState(() {
                                _selectedCategory = 'All';
                                _searchQuery = '';
                              });
                            },
                            child: const Text(
                              'Show All Works',
                              style: TextStyle(
                                fontFamily: AppTheme.fontFamily,
                                color: AppTheme.primaryBlueLight,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  else
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
                          itemCount: filteredProjects.length,
                          itemBuilder: (context, index) {
                            final project = filteredProjects[index];
                            return RepaintBoundary(
                              child: _GalleryItemCard(
                                project: project,
                                onTap: () => _openProject(project),
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

class _GalleryItemCard extends StatefulWidget {
  final ProjectItem project;
  final VoidCallback onTap;

  const _GalleryItemCard({
    required this.project,
    required this.onTap,
  });

  @override
  State<_GalleryItemCard> createState() => _GalleryItemCardState();
}

class _GalleryItemCardState extends State<_GalleryItemCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.project;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          decoration: BoxDecoration(
            color: AppTheme.bgCard,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _hovered
                  ? AppTheme.primaryBlue.withValues(alpha: 0.55)
                  : AppTheme.borderSubtle,
              width: 1,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ProjectArtworkImage(project: p),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.bgDark.withValues(alpha: 0.85),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (p.isFromPinterest) ...[
                              Image.asset(
                                'assets/logo/pinterest_logo.png',
                                width: 12,
                                height: 12,
                              ),
                              const SizedBox(width: 5),
                            ],
                            Text(
                              p.category,
                              style: const TextStyle(
                                fontFamily: AppTheme.fontFamily,
                                color: AppTheme.textPrimary,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                child: Text(
                  p.title,
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
      ),
    );
  }
}
