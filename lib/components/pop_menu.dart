import 'package:flutter/material.dart';
import 'package:spacex_app/components/custom_about_dialog.dart';
import 'package:spacex_app/screens/settings_screen.dart';

IconButton popMenu(ColorScheme colorScheme, BuildContext context) {
  return IconButton(
    icon: Icon(Icons.more_vert, color: colorScheme.onSurface),
    onPressed: () {
      showMenu(
        context: context,
        position: RelativeRect.fromLTRB(
          MediaQuery.of(context).size.width,
          kToolbarHeight,
          0,
          0,
        ),
        items: [
          PopupMenuItem(
            value: 'settings',
            child: Text('Settings'),
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                ),
          ),
          PopupMenuItem(
            value: 'about',
            child: Text('About'),
            onTap:
                () => showDialog(
                  context: context,
                  builder: (context) => CustomAboutDialog(),
                ),
          ),
        ],
      );
    },
  );
}

