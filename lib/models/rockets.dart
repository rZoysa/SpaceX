class Rocket {
  final String id;
  final String name;
  final String description;
  final List<String> images;

  Rocket({required this.id, required this.name, required this.description, required this.images});

  factory Rocket.fromJson(Map<String, dynamic> json) {
    return Rocket(
      id: json['rocket_id'],
      name: json['rocket_name'],
      description: json['description'],
      images: List<String>.from(json['flickr_images']),
    );
  }
}
