class LandPad {
  final String id;
  final String name;
  final String location;
  final double latitude;
  final double longitude;
  final String region;
  final String status;
  final String landingType;
  final int attemptedLandings;
  final int successfulLanding;
  final String wikipedia;
  final String details;

  LandPad({
    required this.id,
    required this.name,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.region,
    required this.status,
    required this.landingType,
    required this.attemptedLandings,
    required this.successfulLanding,
    required this.wikipedia,
    required this.details,
  });

  factory LandPad.fromJson(Map<String, dynamic> json) {
    return LandPad(
      id: json['id'],
      name: json['full_name'],
      location: json['location']['name'],
      latitude: json['location']['latitude'],
      longitude: json['location']['longitude'],
      region: json['location']['region'],
      status: json['status'],
      landingType: json['landing_type'],
      attemptedLandings: json['attempted_landings'],
      successfulLanding: json['successful_landings'],
      wikipedia: json['wikipedia'],
      details: json['details'],
    );
  }
}