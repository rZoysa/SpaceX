import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spacex_app/providers/content_handler_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final provider = Provider.of<ContentHandlerProvider>(context);

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
            value: provider.showRockets,
            onChanged: provider.toggleRockets,
          ),
          SwitchListTile(
            title: Text("Show Launch Pads"),
            activeColor: Colors.green,
            value: provider.showLaunchPads,
            onChanged: provider.toggleLaunchPads,
          ),
          SwitchListTile(
            title: Text("Show Landing Pads"),
            activeColor: Colors.green,
            value: provider.showLandingPads,
            onChanged: provider.toggleLandingPads,
          ),
        ],
      ),
    );
  }
}
