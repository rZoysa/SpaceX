import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/launchpad.dart';

class LaunchPadController {
  static Future<List<LaunchPad>> fetchLaunchPads() async {
    final response = await http.get(Uri.parse('https://api.spacexdata.com/v3/launchpads'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((launchpad) => LaunchPad.fromJson(launchpad)).toList();
    } else {
      throw Exception('Failed to load launchpads');
    }
  }
}
