import 'package:financial_app/config/configuration.dart';
import 'package:financial_app/config/notifx.dart';
import 'package:financial_app/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: AppFirebaseOptions.currentPlatform);

  await FirebaseRemoteConfig.instance.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 20),
      minimumFetchInterval: const Duration(seconds: 20),
    ),
  );

  await FirebaseRemoteConfig.instance.fetchAndActivate();
  await NotificationsFb().activate();

  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  initializeDateFormatting('en_US');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const SplachScreen(),
    );
  }
}
