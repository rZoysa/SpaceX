import 'package:flutter/material.dart';
import 'package:spacex_app/controllers/rocket_controller.dart';
import 'package:spacex_app/models/rockets.dart';
import 'package:spacex_app/views/rockets_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Rocket>> rockets;

  @override
  void initState() {
    rockets = RocketController.fetchRockets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text(
          'SpaceX Explorer',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black12,
      ),
      body: RocketView(rockets: rockets),
    );
  }
}
