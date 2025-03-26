import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/rockets.dart';

class RocketController {
  static Future<List<Rocket>> fetchRockets() async {
    final response = await http.get(
      Uri.parse('https://api.spacexdata.com/v3/rockets'),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((rocket) => Rocket.fromJson(rocket)).toList();
    } else {
      throw Exception('Failed to load rockets');
    }
  }
}
