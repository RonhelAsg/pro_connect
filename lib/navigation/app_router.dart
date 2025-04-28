import 'package:flutter/material.dart';
import '../screens/authentification_page.dart';
import '../screens/onboarding_page.dart';



class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const AuthPage());
      case '/onboarding':
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
