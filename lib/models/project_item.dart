class ProjectItem {
  final String id;
  final String title;
  final String category;
  final String imagePath;
  final String caption;
  final String client;
  final String year;
  final List<String> deliverables;
  final List<String> tools;
  final bool isFeatured;
  final String? sourceUrl;
  final bool isFromPinterest;

  const ProjectItem({
    required this.id,
    required this.title,
    required this.category,
    required this.imagePath,
    required this.caption,
    this.client = 'AVO Media',
    this.year = '2025',
    this.deliverables = const ['High-Res Artwork', 'Social Media Ready'],
    this.tools = const ['Adobe Photoshop'],
    this.isFeatured = false,
    this.sourceUrl,
    this.isFromPinterest = false,
  });

  bool get isNetworkImage =>
      imagePath.startsWith('http://') || imagePath.startsWith('https://');

  String get objective => caption;
  String get creativeDirection => caption;
  String get designApproach => caption;

  factory ProjectItem.fromJson(Map<String, dynamic> json) {
    return ProjectItem(
      id: (json['id'] ?? '').toString(),
      title: (json['title'] ?? 'Visual Design').toString(),
      category: (json['category'] ?? 'Social Media').toString(),
      imagePath: (json['imagePath'] ?? '').toString(),
      caption: (json['caption'] ?? '').toString(),
      client: (json['client'] ?? 'AVO Media').toString(),
      year: (json['year'] ?? '2025').toString(),
      deliverables: (json['deliverables'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          const ['High-Res Artwork', 'Digital & Print'],
      tools: (json['tools'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          const ['Adobe Photoshop'],
      isFeatured: json['isFeatured'] == true,
      sourceUrl: json['sourceUrl']?.toString(),
      isFromPinterest: json['isFromPinterest'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'imagePath': imagePath,
      'caption': caption,
      'client': client,
      'year': year,
      'deliverables': deliverables,
      'tools': tools,
      'isFeatured': isFeatured,
      'sourceUrl': sourceUrl,
      'isFromPinterest': isFromPinterest,
    };
  }
}

