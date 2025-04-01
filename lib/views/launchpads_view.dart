import 'package:flutter/material.dart';
import 'package:spacex_app/models/launchpad.dart';

class LaunchpadsView extends StatelessWidget {
  const LaunchpadsView({super.key, required this.launchpads});

  final Future<List<LaunchPad>> launchpads;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return FutureBuilder<List<LaunchPad>>(
      future: launchpads,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                LaunchPad launchpad = snapshot.data![index];
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors:
                                  isDarkMode
                                      ? [
                                        Color.fromARGB(255, 197, 197, 197),
                                        Color.fromARGB(255, 165, 165, 165),
                                      ]
                                      : [Color(0xFFE0E0E0), Color(0xFFBDBDBD)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                launchpad.shortName,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color:
                                      launchpad.status == 'retired'
                                          ? Colors.red[600]
                                          : launchpad.status == 'active'
                                          ? Colors.green
                                          : Colors.amber[600],
                                ),
                                child: Text(
                                  launchpad.status,
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
