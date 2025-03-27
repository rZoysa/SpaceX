class Rocket {
  final String id;
  final String name;
  final bool activeStatus;
  final int costPerLaunch;
  final int successRate;
  final String firstFlight;
  final double heightMeters;
  final double diameterMeters;
  final int massKg;
  final String description;
  final String wikipedia;
  final List<String> images;

  Rocket({
    required this.id,
    required this.name,
    required this.activeStatus,
    required this.costPerLaunch,
    required this.successRate,
    required this.firstFlight,
    required this.heightMeters,
    required this.diameterMeters,
    required this.massKg,
    required this.description,
    required this.wikipedia,
    required this.images,
  });

  factory Rocket.fromJson(Map<String, dynamic> json) {
    return Rocket(
      id: json['id'].toString(),
      name: json['rocket_name'],
      activeStatus: json['active'] as bool,
      costPerLaunch: json['cost_per_launch'] as int,
      successRate: json['success_rate_pct'] as int,
      firstFlight: json['first_flight'],
      heightMeters: (json['height']['meters'] as num).toDouble(),
      diameterMeters: (json['diameter']['meters'] as num).toDouble(),
      massKg: json['mass']['kg'] as int,
      description: json['description'],
      wikipedia: json['wikipedia'],
      images: List<String>.from(json['flickr_images']),
    );
  }
}
