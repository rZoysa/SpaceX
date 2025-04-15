import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/web.dart';
import 'package:spacex_app/controllers/landpad_controller.dart';
import 'package:spacex_app/controllers/launchpad_controller.dart';
import 'package:spacex_app/controllers/rocket_controller.dart';
import 'package:spacex_app/models/landpad.dart';
import 'package:spacex_app/models/launchpad.dart';
import 'package:spacex_app/models/rockets.dart';

class DataHandlerProvider with ChangeNotifier {
  late Future<List<Rocket>> rockets = Future.value([]);
  late Future<List<LaunchPad>> launchPads = Future.value([]);
  late Future<List<LandPad>> landPads = Future.value([]);

  bool _hasConnection = true;
  bool _hasContent = false;
  bool _fetchSkipped = false;

  bool get hasConnection => _hasConnection;
  bool get hasContent => _hasContent;
  bool get fetchSkipped => _fetchSkipped;

  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  DataHandlerProvider() {
    _initConnectivityListener();
  }

  void _initConnectivityListener() {
    Connectivity().checkConnectivity().then((result) {
      _hasConnection = result.first != ConnectivityResult.none;
      notifyListeners();
    });

    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((
      result,
    ) {
      _hasConnection = result.first != ConnectivityResult.none;
      // Logger().f("Connectivity changed in provider: $_hasConnection");
      notifyListeners();
    });
  }

  Future<void> fetchData(BuildContext context) async {
    if (!_hasConnection) {
      Logger().f("No internet connection, cannot fetch data.");
      _showSkippedSnackbar(context);
      checkHasContent();
      return;
    }

    _fetchSkipped = false;

    try {
      rockets = RocketController.fetchRockets();
      launchPads = LaunchPadController.fetchLaunchPads();
      landPads = LandPadController.fetchLandPads();
    } catch (e) {
      Logger().f("Error fetching data: $e");
    }

    checkHasContent();
    notifyListeners(); // Notify UI that new data is available
  }

  void _showSkippedSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("No internet connection, Cannot fetch data."),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red.shade400,
      ),
    );
  }

  void checkHasContent() async {
    final rocketsList = await rockets;
    final launchPadsList = await launchPads;
    final landPadsList = await landPads;

    if (rocketsList.isEmpty && launchPadsList.isEmpty && landPadsList.isEmpty) {
      _hasContent = false;
    } else {
      _hasContent = true;
    }
  }

  void resetFetchSkipped() {
    _fetchSkipped = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _connectivitySubscription?.cancel();
    super.dispose();
  }
}
