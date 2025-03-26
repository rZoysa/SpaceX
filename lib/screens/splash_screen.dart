import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spacex_app/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initializeApp();
  }

  Future<void> initializeApp() async {
    await Future.delayed(Duration(seconds: 3));
    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Image.asset('assets/images/logo.jpg')),
    );
  }
}
