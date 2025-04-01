import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spacex_app/controllers/landpad_controller.dart';
import 'package:spacex_app/controllers/launchpad_controller.dart';
import 'package:spacex_app/controllers/rocket_controller.dart';
import 'package:spacex_app/models/landpad.dart';
import 'package:spacex_app/models/launchpad.dart';
import 'package:spacex_app/models/rockets.dart';
import 'package:spacex_app/views/landingpads_view.dart';
import 'package:spacex_app/views/launchpads_view.dart';
import 'package:spacex_app/views/rockets_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Rocket>> rockets;
  late Future<List<LaunchPad>> launchpads;
  late Future<List<LandPad>> landPads;

  @override
  void initState() {
    rockets = RocketController.fetchRockets();
    launchpads = LaunchPadController.fetchLaunchPads();
    landPads = LandPadController.fetchLandPads();
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
                launchpads = LaunchPadController.fetchLaunchPads();
                landPads = LandPadController.fetchLandPads();
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
          Divider(color: colorScheme.onSurface, height: 4),
          RocketView(rockets: rockets),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 4),
            child: Text(
              'Launch Pads',
              style: TextStyle(
                color: colorScheme.onSurface,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Divider(color: colorScheme.onSurface, height: 4),
          LaunchpadsView(launchpads: launchpads),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 4),
            child: Text(
              'Landing Pads',
              style: TextStyle(
                color: colorScheme.onSurface,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(color: colorScheme.onSurface, height: 4),
          LandingpadsView(landPads: landPads),
        ],
      ),
    );
  }
}
