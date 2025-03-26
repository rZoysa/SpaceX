import 'package:flutter/material.dart';

import '../models/rockets.dart';

class RocketView extends StatelessWidget {
  const RocketView({super.key, required this.rockets});

  final Future<List<Rocket>> rockets;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Rocket>>(
      future: rockets,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Rocket rocket = snapshot.data![index];
              return ListTile(
                leading: Image.network(
                  rocket.images.isNotEmpty ? rocket.images[0] : '',
                ),
                title: Text(rocket.name),
                subtitle: Text(rocket.description),
              );
            },
          );
        }
      },
    );
  }
}
