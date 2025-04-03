import 'package:flutter/material.dart';
import 'package:spacex_app/providers/data_handler_provider.dart';
import 'package:spacex_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(SpaceXApp());
}

class SpaceXApp extends StatelessWidget {
  const SpaceXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataHandlerProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SpaceX Info',
        theme: ThemeData(
          brightness: Brightness.light,
          colorScheme: ColorScheme.light(
            primary: Colors.white,
            surface: Colors.grey[100]!,
            surfaceContainerHighest: Colors.grey[400],
            onSurface: Colors.black,
            onSurfaceVariant: Colors.grey[800]!,
          ),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          colorScheme: ColorScheme.dark(
            primary: Colors.black,
            surface: Colors.black,
            surfaceContainerHighest: Colors.grey[900],
            onSurface: Colors.white,
            onSurfaceVariant: Colors.grey[600]!,
          ),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
