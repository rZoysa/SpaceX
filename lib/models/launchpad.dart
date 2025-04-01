class LaunchPad {
  final String id;
  final String shortName;
  final String longName;
  final String location;
  final String region;
  final String status;
  final String details;
  final String attemtepLaunches;
  final String successfulLaunches;
  final String wikipedia;

  LaunchPad({
    required this.id,
    required this.shortName,
    required this.longName,
    required this.location,
    required this.region,
    required this.status,
    required this.details,
    required this.attemtepLaunches,
    required this.successfulLaunches,
    required this.wikipedia,
  });

  factory LaunchPad.fromJson(Map<String, dynamic> json) {
    return LaunchPad(
      id: json['id'].toString(),
      shortName: json['name'],
      longName: json['site_name_long'],
      location: json['location']['name'],
      region: json['location']['region'],
      status: json['status'],
      details: json['details'],
      attemtepLaunches: json['attempted_launches'].toString(),
      successfulLaunches: json['successful_launches'].toString(),
      wikipedia: json['wikipedia'],
    );
  }
}
