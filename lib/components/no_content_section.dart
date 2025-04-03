// Helper method to build "No Content Available" message
  import 'package:flutter/material.dart';

Widget buildNoContentMessage(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.visibility_off, size: 50, color: Colors.grey),
            SizedBox(height: 10),
            Text(
              "No Content Available",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 5),
            Text(
              "Enable at least one category in Settings.",
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }