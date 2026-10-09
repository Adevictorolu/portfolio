import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/project_item.dart';
import '../data/portfolio_data.dart';
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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1100;
    final isTablet = screenWidth >= 700;

    // Filter projects
    final filteredProjects = PortfolioData.projects.where((project) {
      final matchesCategory = _selectedCategory == 'All' || project.category == _selectedCategory;
      final query = _searchQuery.toLowerCase().trim();
      final matchesSearch = query.isEmpty ||
          project.title.toLowerCase().contains(query) ||
          project.client.toLowerCase().contains(query) ||
          project.category.toLowerCase().contains(query) ||
          project.objective.toLowerCase().contains(query);
      return matchesCategory && matchesSearch;
    }).toList();

    return Container(
      width: double.infinity,
      color: AppTheme.bgSurface,
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
              // Section Title Header
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.primaryBlue.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'COMPREHENSIVE PORTFOLIO ARCHIVE',
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
                'Explore All Visual Works',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Filter through branding systems, conference flyers, ministry campaigns, commercial promotions, and book covers.',
                style: TextStyle(
                  fontSize: 15,
                  color: AppTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 36),

              // Filter Controls & Search Bar
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category Tabs
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _categories.map((cat) {
                        final isSelected = _selectedCategory == cat;
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: FilterChip(
                            label: Text(cat),
                            selected: isSelected,
                            onSelected: (_) => setState(() => _selectedCategory = cat),
                            backgroundColor: AppTheme.bgCard,
                            selectedColor: AppTheme.primaryBlue,
                            labelStyle: TextStyle(
                              color: isSelected ? Colors.white : AppTheme.textSecondary,
                              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                              fontSize: 13,
                            ),
                            side: BorderSide(
                              color: isSelected ? AppTheme.primaryBlue : AppTheme.borderSubtle,
                              width: 1,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            showCheckmark: false,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Search Bar + Count indicator
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppTheme.bgCard,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppTheme.borderSubtle),
                          ),
                          child: TextField(
                            controller: _searchController,
                            onChanged: (val) => setState(() => _searchQuery = val),
                            style: const TextStyle(color: Colors.white, fontSize: 14),
                            decoration: InputDecoration(
                              hintText: 'Search by keyword (e.g., church, boat cruise, luxury, real estate)...',
                              hintStyle: const TextStyle(color: AppTheme.textMuted, fontSize: 13),
                              prefixIcon: const Icon(Icons.search, color: AppTheme.textMuted, size: 20),
                              suffixIcon: _searchQuery.isNotEmpty
                                  ? IconButton(
                                      icon: const Icon(Icons.clear, color: AppTheme.textMuted, size: 18),
                                      onPressed: () {
                                        _searchController.clear();
                                        setState(() => _searchQuery = '');
                                      },
                                    )
                                  : null,
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        decoration: BoxDecoration(
                          color: AppTheme.bgCard,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppTheme.borderSubtle),
                        ),
                        child: Text(
                          '${filteredProjects.length} Projects',
                          style: const TextStyle(
                            color: AppTheme.goldAccentLight,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 36),

              // Portfolio Grid
              if (filteredProjects.isEmpty)
                Container(
                  padding: const EdgeInsets.all(48),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppTheme.bgCard,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppTheme.borderSubtle),
                  ),
                  child: Column(
                    children: [
                      const Icon(Icons.search_off_rounded, color: AppTheme.textMuted, size: 48),
                      const SizedBox(height: 16),
                      const Text(
                        'No projects matched your search criteria',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () {
                          _searchController.clear();
                          setState(() {
                            _selectedCategory = 'All';
                            _searchQuery = '';
                          });
                        },
                        child: const Text('Reset Filters', style: TextStyle(color: AppTheme.primaryBlueLight)),
                      ),
                    ],
                  ),
                )
              else
                LayoutBuilder(
                  builder: (context, constraints) {
                    int crossAxisCount = 1;
                    if (constraints.maxWidth >= 1024) {
                      crossAxisCount = 4;
                    } else if (constraints.maxWidth >= 720) {
                      crossAxisCount = 3;
                    } else if (constraints.maxWidth >= 480) {
                      crossAxisCount = 2;
                    }

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 18,
                        mainAxisSpacing: 20,
                        childAspectRatio: 0.76,
                      ),
                      itemCount: filteredProjects.length,
                      itemBuilder: (context, index) {
                        final project = filteredProjects[index];
                        return _GalleryItemCard(
                          project: project,
                          onTap: () => _openProject(project),
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
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: _hovered ? AppTheme.goldAccent.withValues(alpha: 0.5) : AppTheme.borderCard,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: _hovered ? Colors.black.withValues(alpha: 0.4) : Colors.black.withValues(alpha: 0.15),
                blurRadius: _hovered ? 16 : 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                        child: const Icon(Icons.image, color: AppTheme.textMuted),
                      ),
                    ),
                    if (_hovered)
                      Container(
                        color: AppTheme.bgDark.withValues(alpha: 0.7),
                        child: const Center(
                          child: Icon(Icons.zoom_in, color: Colors.white, size: 28),
                        ),
                      ),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppTheme.bgDark.withValues(alpha: 0.85),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          widget.project.category,
                          style: const TextStyle(
                            color: AppTheme.goldAccentLight,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                color: AppTheme.bgCard,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.project.client,
                      style: const TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 11,
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
