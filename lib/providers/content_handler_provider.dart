import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContentHandlerProvider with ChangeNotifier {
  bool _showRockets = true;
  bool _showLaunchPads = true;
  bool _showLandingPads = true;

  //Getters
  bool get showRockets => _showRockets;
  bool get showLaunchPads => _showLaunchPads;
  bool get showLandingPads => _showLandingPads;

  //Load Preferences
  Future<void> loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    _showRockets = prefs.getBool('showRockets') ?? true;
    _showLaunchPads = prefs.getBool('showLaunchPads') ?? true;
    _showLandingPads = prefs.getBool('showLandingPads') ?? true;
    notifyListeners();
  }

  Future<void> toggleRockets(bool value) async {
    _showRockets = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('showRockets', value);
    notifyListeners();
  }
  Future<void> toggleLaunchPads(bool value) async {
    _showLaunchPads = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('showLaunchPads', value);
    notifyListeners();
  }
  Future<void> toggleLandingPads(bool value) async {
    _showLandingPads = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('showLandingPads', value);
    notifyListeners();
  }
}
