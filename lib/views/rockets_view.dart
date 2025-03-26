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
          return SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Rocket rocket = snapshot.data![index];
                return Container(
                  margin: EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          rocket.images.isNotEmpty ? rocket.images[0] : '',
                          fit: BoxFit.contain,
                          height: 250,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        right: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              rocket.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color:
                                    rocket.activeStatus
                                        ? Colors.green
                                        : const Color.fromARGB(255, 231, 70, 58),
                              ),
                              child: Text(
                                rocket.activeStatus ? 'Active' : 'Inactive',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
