class ProjectItem {
  final String id;
  final String title;
  final String category;
  final String imagePath;
  final String client;
  final String year;
  final String objective;
  final String creativeDirection;
  final String designApproach;
  final List<String> deliverables;
  final List<String> tools;
  final bool isFeatured;

  const ProjectItem({
    required this.id,
    required this.title,
    required this.category,
    required this.imagePath,
    required this.client,
    required this.year,
    required this.objective,
    required this.creativeDirection,
    required this.designApproach,
    required this.deliverables,
    required this.tools,
    this.isFeatured = false,
  });
}
