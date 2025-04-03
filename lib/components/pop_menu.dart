import 'package:flutter/material.dart';
import 'package:spacex_app/screens/settings_screen.dart';

PopupMenuButton<String> popMenu(ColorScheme colorScheme, BuildContext context) {
  return PopupMenuButton<String>(
    color: colorScheme.surfaceContainerHighest,
    icon: Icon(Icons.more_vert, color: colorScheme.onSurface),
    onSelected: (String value) {
      if (value == 'settings') {
        // Navigate to settings screen
        Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
      } else if (value == 'about') {
        // Show about dialog
        showAboutDialog(
          context: context,
          applicationName: "SpaceX Explorer",
          applicationVersion: "1.0.0",
          applicationLegalese: "© 2024 SpaceX Explorer",
        );
      }
    },
    itemBuilder:
        (BuildContext context) => [
          PopupMenuItem(
            value: 'settings',
            child: Row(children: [SizedBox(width: 10), Text('Settings')]),
          ),
          PopupMenuItem(
            value: 'about',
            child: Row(children: [SizedBox(width: 10), Text('About')]),
          ),
        ],
  );
}
