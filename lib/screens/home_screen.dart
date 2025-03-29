import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spacex_app/controllers/rocket_controller.dart';
import 'package:spacex_app/models/rockets.dart';
import 'package:spacex_app/views/rockets_view.dart';

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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(
          'SpaceX Explorer',
          style: TextStyle(
            color: colorScheme.onSurface,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 4),
          child: SvgPicture.asset(
            'assets/images/icon.svg',
            colorFilter: ColorFilter.mode(
              colorScheme.onSurface,
              BlendMode.srcIn,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: colorScheme.onSurface),
            onPressed: () {
              setState(() {
                rockets = RocketController.fetchRockets();
              });
            },
          ),
        ],
        backgroundColor: colorScheme.surface,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 4),
            child: Text(
              'Rockets',
              style: TextStyle(
                color: colorScheme.onSurface,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(color: colorScheme.onSurface, height: 2),
          Flexible(child: RocketView(rockets: rockets)),
        ],
      ),
    );
  }
}
