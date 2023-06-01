import 'package:acthub/config/dependency_injection.dart';
import 'package:acthub/core/resources/manager_string.dart';
import 'package:acthub/features/auth/presentation/view/login_view.dart';
import 'package:acthub/features/out_boarding/presentation%20/view/out_boarding_view.dart';
import 'package:acthub/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashView = '/splash_view';
  static const String outBoardingView = '/out_boarding_view';
  static const String loginView = '/login_view';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        initSplash();
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.outBoardingView:
        initOutBoarding();
        return MaterialPageRoute(builder: (_) => const OutBoardingView());
      case Routes.loginView:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(ManagerString.noRoutFound),
        ),
        body: const Center(
          child: Text(ManagerString.noRoutFound),
        ),
      ),
    );
  }
}
