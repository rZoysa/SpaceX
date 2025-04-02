import 'package:flutter/foundation.dart';
import 'package:logger/web.dart';
import 'package:spacex_app/controllers/landpad_controller.dart';
import 'package:spacex_app/controllers/launchpad_controller.dart';
import 'package:spacex_app/controllers/rocket_controller.dart';
import 'package:spacex_app/models/landpad.dart';
import 'package:spacex_app/models/launchpad.dart';
import 'package:spacex_app/models/rockets.dart';

class DataHandlerProvider with ChangeNotifier {
  late Future<List<Rocket>> rockets = Future.value([]);
  late Future<List<LaunchPad>> launchPads= Future.value([]);
  late Future<List<LandPad>> landPads= Future.value([]);

  Future<void> fetchData() async {
    try {
      rockets = RocketController.fetchRockets();
      launchPads = LaunchPadController.fetchLaunchPads();
      landPads = LandPadController.fetchLandPads();
    } catch (e) {
      Logger().f("Error fetching data: $e");
    }

    notifyListeners(); // Notify UI that new data is available
  }
}
