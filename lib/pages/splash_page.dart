import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:financial_app/main.dart';
import 'package:financial_app/pages/home_page.dart';
import 'package:financial_app/pages/onBoarding_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: const Color(0xFFF0f0f0),
      duration: 1000,
      splashIconSize: double.infinity,
      splash: Center(
        child: Image.asset(
          'assets/splash_icon.png',
          height: 200,
          width: 200,
        ),
      ),
      nextScreen: initScreen == 0 || initScreen == null
          ? const OnBoardingPage()
          : const HomePage(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
