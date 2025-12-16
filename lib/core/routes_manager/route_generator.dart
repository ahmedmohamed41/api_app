import 'package:api_app/core/routes_manager/routes.dart';
import 'package:api_app/features/auth/view/sign_in_view.dart';
import 'package:api_app/features/auth/view/signup_view.dart';
import 'package:api_app/root.dart';
import 'package:api_app/splash.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInView());
      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case Routes.rootRoute:
        return MaterialPageRoute(builder: (_) => const Root());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
