// Helper method to build section titles
import 'package:flutter/material.dart';

Widget buildSectionTitle(String title, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(left: 4),
        child: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Divider(color: Theme.of(context).colorScheme.onSurface, height: 4),
    ],
  );
}
