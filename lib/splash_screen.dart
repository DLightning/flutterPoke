import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_poke/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (context, animation, secondaryAnimation) {
            return const HomeScreen();
          },
          /*transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },*/
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Hero(
                tag: 'pkball', // Unique tag for the Hero animation
                child: Image.asset(
                  'images/pokeball.png',
                  fit: BoxFit.contain,
                  //width: 600,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/poke.gif',
                  width: 250, // Adjust the size as needed
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
