import 'package:flutter/material.dart';
// import 'package:hydropome2/screen/auth/personalization/surver2_screen.dart';


import '../../screen/splash_onboarding/onboarding.dart';
import '../../screen/splash_onboarding/onboarding2.dart';
import '../../screen/auth/login.dart';
import '../../screen/auth/register.dart';
import '../../screen/auth/personalization/survery.dart';
import '../../screen/auth/personalization/survery2.dart';
import '../../screen/auth/personalization/survery3.dart';
import '../../screen/homepage/homepage_screen.dart';
import '../../screen/homepage/profile/personalsasi_screen.dart';

class AppRouter {
  static const splash = '/splash';
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const register = '/register';
  static const onboarding2 = '/onboarding2';
  static const survey = '/survey';
  static const survey2 = '/survey2';
  static const survey3 = '/survey3';
  static const homepage = '/homepage';
   static const personalisasi = '/personalisasi';


  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      
      case onboarding2:
        return MaterialPageRoute(builder: (_) => const Onboarding2Screen());

      case survey:
        return MaterialPageRoute(builder: (_) => const SurveryScreen());

      case survey2:
        return MaterialPageRoute(builder: (_) => const SurveryScreen2());

      case survey3:
        return MaterialPageRoute(builder: (_) => const SurveyScreen3());

      case homepage:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case personalisasi:
        return MaterialPageRoute(builder: (_) => EditProfileScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Route gk ada")),
          ),
        );
    }
  }
}
