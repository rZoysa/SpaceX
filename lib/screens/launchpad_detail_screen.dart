import 'package:flutter/material.dart';
import 'package:spacex_app/components/detail_row.dart';
import 'package:spacex_app/models/launchpad.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchpadDetailScreen extends StatelessWidget {
  final LaunchPad launchPad;

  const LaunchpadDetailScreen({super.key, required this.launchPad});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textColor = colorScheme.onSurface; // Adapts to dark/light mode

    return Scaffold(
      backgroundColor: colorScheme.surface, // Adapt to theme
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          launchPad.shortName,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
        elevation: 10,
        backgroundColor: colorScheme.surface,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),

            // Rocket Details
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      launchPad.longName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Divider(height: 30, thickness: 2),
                  DetailRow(
                    label: "Location",
                    value: "${launchPad.location}, ${launchPad.region}",
                  ),
                  DetailRow(label: "Status", value: launchPad.status),
                  DetailRow(
                    label: "Attempted Launches",
                    value: launchPad.attemtepLaunches,
                  ),
                  DetailRow(
                    label: "Successful Launches",
                    value: launchPad.successfulLaunches,
                  ),

                  SizedBox(height: 20),

                  // Description
                  Text(
                    "About ${launchPad.shortName}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    launchPad.details,
                    style: TextStyle(
                      fontSize: 16,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),

                  SizedBox(height: 20),

                  // Wikipedia Link Button
                  Center(
                    child: TextButton(
                      onPressed: () => _launchURL(launchPad.wikipedia),
                      style: TextButton.styleFrom(
                        foregroundColor: colorScheme.primary,
                        backgroundColor: colorScheme.onSurface,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      child: Text("Read More on Wikipedia"),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () => _launchURL(launchPad.wikipedia),
                      style: TextButton.styleFrom(
                        foregroundColor: colorScheme.primary,
                        backgroundColor: colorScheme.onSurface,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      child: Text("View Location"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to open Wikipedia link
  void _launchURL(String url) async {
    if (url.isEmpty) return;
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
