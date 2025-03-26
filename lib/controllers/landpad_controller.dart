import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/landpad.dart';

class LandPadController {
  static Future<List<LandPad>> fetchLandPads() async {
    final response = await http.get(Uri.parse('https://api.spacexdata.com/v3/landpads'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((landpad) => LandPad.fromJson(landpad)).toList();
    } else {
      throw Exception('Failed to load landpads');
    }
  }
}
