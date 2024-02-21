import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:financial_app/main.dart';
import 'package:financial_app/pages/home_page.dart';
import 'package:financial_app/pages/onBoarding_page.dart';
import 'package:financial_app/pages/qutrix/qutrix_page.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  String? _qutrix;

  @override
  void initState() {
    super.initState();
    _in();
  }

  void _in() {
    _ff();
    final qutrix = FirebaseRemoteConfig.instance.getString('qutrix');
    if (!qutrix.contains('Qutrix')) {
      setState(() {
        _qutrix = qutrix;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_qutrix != null) {
      return QutrixPage(qutrix: _qutrix!);
    }

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

Future<void> _ff() async {
  final bd = await SharedPreferences.getInstance();
  final rev = InAppReview.instance;
  bool alreadyRated = bd.getBool('isRated') ?? false;
  if (!alreadyRated) {
    if (await rev.isAvailable()) {
      rev.requestReview();
      await bd.setBool('isRated', true);
    }
  }
}
