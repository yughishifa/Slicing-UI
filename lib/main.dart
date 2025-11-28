import 'package:flutter/material.dart';
import 'package:hydropome/views/SplashView.dart';
import 'package:hydropome/views/onboarding.dart';
import 'package:hydropome/views/onboarding2.dart';
import 'package:hydropome/views/clip_paths.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color greenColor = Color(0xFF093731);
    final Color primaryAppColor = greenColor;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HydropoMe',
      theme: ThemeData(
        primaryColor: primaryAppColor,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const SplashView(),
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
      },
    );
  }
}