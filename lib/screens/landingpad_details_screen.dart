import 'package:flutter/material.dart';
import 'package:spacex_app/components/detail_row.dart';
import 'package:spacex_app/models/landpad.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingpadDetailsScreen extends StatelessWidget {
  final LandPad landPad;

  const LandingpadDetailsScreen({super.key, required this.landPad});

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
          landPad.id,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
        elevation: 10,
        backgroundColor: colorScheme.surface,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
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
                        landPad.name,
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
                      value: "${landPad.location}, ${landPad.region}",
                    ),
                    DetailRow(label: "Status", value: landPad.status),
                    DetailRow(label: "Landing Type", value: landPad.landingType),
                    DetailRow(
                      label: "Attempted Landings",
                      value: landPad.attemptedLandings.toString(),
                    ),
                    DetailRow(
                      label: "Successful Landings",
                      value: landPad.successfulLanding.toString(),
                    ),
          
                    SizedBox(height: 20),
          
                    // Description
                    Text(
                      "About ${landPad.id}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      landPad.details,
                      style: TextStyle(
                        fontSize: 16,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
          
                    SizedBox(height: 20),
          
                    // Wikipedia Link Button
                    Center(
                      child: TextButton(
                        onPressed: () => _launchURL(landPad.wikipedia),
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
                        onPressed:
                            () => _openMap(landPad.latitude, landPad.longitude),
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

  Future<void> _openMap(double latitude, double longitude) async {
    final Uri googleMapsUrl = Uri.parse(
      "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude",
    );
    final Uri appleMapsUrl = Uri.parse("maps://?q=$latitude,$longitude");

    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl);
    } else if (await canLaunchUrl(appleMapsUrl)) {
      await launchUrl(appleMapsUrl);
    } else {
      throw 'Could not launch map';
    }
  }
}
