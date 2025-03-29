import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import 'package:spacex_app/components/detail_row.dart';
import '../models/rockets.dart';
import 'package:url_launcher/url_launcher.dart';

class RocketDetailsScreen extends StatelessWidget {
  final Rocket rocket;

  const RocketDetailsScreen({super.key, required this.rocket});

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
          rocket.name,
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

            // Image Slider
            CarouselSlider(
              options: CarouselOptions(
                height: 250,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items:
                  rocket.images.map((imageUrl) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageUrl,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        loadingBuilder:
                            (context, child, loadingProgress) =>
                                loadingProgress == null
                                    ? child
                                    : Center(
                                      child: CircularProgressIndicator(
                                        color: colorScheme.onSurface,
                                      ),
                                    ),
                      ),
                    );
                  }).toList(),
            ),

            SizedBox(height: 20),

            // Rocket Details
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailRow(
                    label: "Cost per launch",
                    value:
                        "\$ ${NumberFormat("#,##0").format(rocket.costPerLaunch)}",
                  ),
                  DetailRow(
                    label: "Success rate",
                    value: "${rocket.successRate}%",
                  ),
                  DetailRow(label: "First flight", value: rocket.firstFlight),
                  DetailRow(label: "Height", value: "${rocket.heightMeters} m"),
                  DetailRow(
                    label: "Diameter",
                    value: "${rocket.diameterMeters} m",
                  ),
                  DetailRow(label: "Mass", value: "${rocket.massKg} kg"),

                  SizedBox(height: 20),

                  // Description
                  Text(
                    "About ${rocket.name}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textColor, // Adapts to theme
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    rocket.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),

                  SizedBox(height: 20),

                  // Wikipedia Link Button
                  Center(
                    child: TextButton(
                      onPressed: () => _launchURL(rocket.wikipedia),
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
