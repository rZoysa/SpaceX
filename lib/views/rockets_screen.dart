import 'package:flutter/material.dart';

import '../controllers/rocket_controller.dart';
import '../models/rockets.dart';

class RocketsScreen extends StatefulWidget {
  const RocketsScreen({super.key});

  @override
  _RocketsScreenState createState() => _RocketsScreenState();
}

class _RocketsScreenState extends State<RocketsScreen> {
  late Future<List<Rocket>> rockets;

  @override
  void initState() {
    super.initState();
    rockets = RocketController.fetchRockets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SpaceX Rockets')),
      body: FutureBuilder<List<Rocket>>(
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
      ),
    );
  }
}
