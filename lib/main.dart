import 'package:flutter/material.dart';
import 'package:spacex_app/screens/splash_screen.dart';

void main() {
  runApp(SpaceXApp());
}

class SpaceXApp extends StatelessWidget {
  const SpaceXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SpaceX Info',
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(
          primary: Colors.white,
          surface: Colors.grey[100]!,
          onSurface: Colors.black,
          onSurfaceVariant: Colors.grey[800]!,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: Colors.black,
          surface: Colors.black,
          onSurface: Colors.white,
          onSurfaceVariant: Colors.grey[600]!,
        ),
      ),
      home: SplashScreen(),
    );
  }
}
