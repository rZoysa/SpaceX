class LaunchPad {
  final String id;
  final String name;
  final String location;
  final String status;
  final List<String> images;

  LaunchPad({required this.id, required this.name, required this.location, required this.status, required this.images});

  factory LaunchPad.fromJson(Map<String, dynamic> json) {
    return LaunchPad(
      id: json['id'],
      name: json['site_name_long'],
      location: json['location']['name'],
      status: json['status'],
      images: json['images'] != null ? List<String>.from(json['images']) : [],
    );
  }
}
