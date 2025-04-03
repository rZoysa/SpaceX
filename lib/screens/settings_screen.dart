import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _showRockets = true;
  bool _showLaunchPads = true;
  bool _showLandingPads = true;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _showRockets = prefs.getBool('showRockets') ?? true;
      _showLaunchPads = prefs.getBool('showLaunchPads') ?? true;
      _showLandingPads = prefs.getBool('showLandingPads') ?? true;
    });
  }

  Future<void> _savePreference(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text("Show Rockets"),
            activeColor: Colors.green,
            value: _showRockets,
            onChanged: (value) {
              setState(() {
                _showRockets = value;
              });
              _savePreference('showRockets', value);
            },
          ),
          SwitchListTile(
            title: Text("Show Launch Pads"),
            activeColor: Colors.green,
            value: _showLaunchPads,
            onChanged: (value) {
              setState(() {
                _showLaunchPads = value;
              });
              _savePreference('showLaunchPads', value);
            },
          ),
          SwitchListTile(
            title: Text("Show Landing Pads"),
            activeColor: Colors.green,
            value: _showLandingPads,
            onChanged: (value) {
              setState(() {
                _showLandingPads = value;
              });
              _savePreference('showLandingPads', value);
            },
          ),
        ],
      ),
    );
  }
}
