class PackageItem {
  final String id;
  final String name;
  final String? badge;
  final String targetAudience;
  final String description;
  final int priceNgn;
  final int priceUsd;
  final List<String> features;
  final bool isPopular;

  const PackageItem({
    required this.id,
    required this.name,
    this.badge,
    required this.targetAudience,
    required this.description,
    required this.priceNgn,
    required this.priceUsd,
    required this.features,
    this.isPopular = false,
  });
}
