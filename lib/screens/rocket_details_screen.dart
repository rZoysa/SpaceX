import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/rockets.dart';
import 'package:url_launcher/url_launcher.dart';

class RocketDetailsScreen extends StatelessWidget {
  final Rocket rocket;

  const RocketDetailsScreen({super.key, required this.rocket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(rocket.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Slider
            CarouselSlider(
              options: CarouselOptions(
                height: 250,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items: rocket.images.map((imageUrl) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
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
                  DetailRow(label: "Cost per launch", value: "\$${rocket.costPerLaunch}"),
                  DetailRow(label: "Success rate", value: "${rocket.successRate}%"),
                  DetailRow(label: "First flight", value: rocket.firstFlight),
                  DetailRow(label: "Height", value: "${rocket.heightMeters} m"),
                  DetailRow(label: "Diameter", value: "${rocket.diameterMeters} m"),
                  DetailRow(label: "Mass", value: "${rocket.massKg} kg"),

                  SizedBox(height: 20),
                  
                  // Description
                  Text(
                    "Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(rocket.description, style: TextStyle(fontSize: 16)),

                  SizedBox(height: 20),

                  // Wikipedia Link Button
                  Center(
                    child: TextButton(
                      onPressed: () => _launchURL(rocket.wikipedia),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

// Widget for displaying a detail row
class DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(value, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
