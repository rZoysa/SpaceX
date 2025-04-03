import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:spacex_app/components/pop_menu.dart';
import 'package:spacex_app/providers/content_handler_provider.dart';
import 'package:spacex_app/providers/data_handler_provider.dart';
import 'package:spacex_app/views/landingpads_view.dart';
import 'package:spacex_app/views/launchpads_view.dart';
import 'package:spacex_app/views/rockets_view.dart';
import 'package:vibration/vibration.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (!mounted) return;
      Provider.of<DataHandlerProvider>(context, listen: false).fetchData();
    });
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
          Builder(
            builder: (context) {
              return popMenu(colorScheme, context);
            },
          ),
        ],

        backgroundColor: colorScheme.surface,
      ),
      body: Consumer2<DataHandlerProvider, ContentHandlerProvider>(
        builder: (context, dataProvider, contentProvider, child) {
          return CustomRefreshIndicator(
            onRefresh: () async {
              dataProvider.fetchData();
            },
            triggerMode: IndicatorTriggerMode.onEdge,
            onStateChanged: (change) {
              if (change.currentState == IndicatorState.armed) {
                Vibration.vibrate(duration: 70);
              }
            },
            durations: RefreshIndicatorDurations(
              completeDuration: Durations.extralong2,
            ),
            builder: (context, child, controller) {
              return Stack(
                alignment: Alignment.topCenter,
                children: [
                  //Rocket Indicator
                  Positioned(
                    top: 5 * controller.value,
                    child: Opacity(
                      opacity: controller.value.clamp(0.0, 1.0),
                      child: Transform.translate(
                        offset: Offset(0, 10 * controller.value),
                        child: SvgPicture.asset(
                          'assets/images/rocket.svg',
                          height: 50,
                          colorFilter: ColorFilter.mode(
                            colorScheme.onSurfaceVariant,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// **Moves the Content Down as User Pulls**
                  Transform.translate(
                    offset: Offset(0, 45 * controller.value),
                    child: child,
                  ),
                ],
              );
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (contentProvider.showRockets) ...[
                    _buildSectionTitle('Rockets', context),
                    RocketView(rockets: dataProvider.rockets),
                    SizedBox(height: 10),
                  ],

                  if (contentProvider.showLaunchPads) ...[
                    _buildSectionTitle('Launch Pads', context),
                    LaunchpadsView(launchpads: dataProvider.launchPads),
                    SizedBox(height: 10),
                  ],

                  if (contentProvider.showLandingPads) ...[
                    _buildSectionTitle('Landing Pads', context),
                    LandingpadsView(landPads: dataProvider.landPads),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Helper method to build section titles
  Widget _buildSectionTitle(String title, BuildContext context) {
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
}
