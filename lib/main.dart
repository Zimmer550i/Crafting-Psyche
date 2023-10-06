import 'package:flutter/material.dart';
import 'package:mission_phyche_asteroid/pages/splash.dart';
import 'package:mission_phyche_asteroid/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<void> _loadProgress() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    progress =
        _prefs.getStringList('progress') ?? ['true', 'false', 'false', 'false', 'false'];
  }

  @override
  Widget build(BuildContext context) {
    _loadProgress();

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
