class LandPad {
  final String id;
  final String name;
  final String location;
  final String status;
  final List<String> images;

  LandPad({required this.id, required this.name, required this.location, required this.status, required this.images});

  factory LandPad.fromJson(Map<String, dynamic> json) {
    return LandPad(
      id: json['id'],
      name: json['full_name'],
      location: json['location']['name'],
      status: json['status'],
      images: json['images'] != null ? List<String>.from(json['images']) : [],
    );
  }
}
