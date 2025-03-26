class Rocket {
  final String id;
  final String name;
  final bool activeStatus;
  final String description;
  final List<String> images;

  Rocket({
    required this.id,
    required this.name,
    required this.activeStatus,
    required this.description,
    required this.images,
  });

  factory Rocket.fromJson(Map<String, dynamic> json) {
    return Rocket(
      id: json['id'].toString(),
      name: json['rocket_name'],
      activeStatus: json['active'] as bool,
      description: json['description'],
      images: List<String>.from(json['flickr_images']),
    );
  }
}
