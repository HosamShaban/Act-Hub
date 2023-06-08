import 'package:acthub/config/dependency_injection.dart';
import 'package:acthub/core/resources/manager_string.dart';
import 'package:acthub/features/auth/presentation/view/login_view.dart';
import 'package:acthub/features/auth/presentation/view/register_view.dart';
import 'package:acthub/features/home/presentation/view/home_view.dart';
import 'package:acthub/features/main/presentation/view/main_view.dart';
import 'package:acthub/features/out_boarding/presentation%20/view/out_boarding_view.dart';
import 'package:acthub/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashView = '/splash_view';
  static const String outBoardingView = '/out_boarding_view';
  static const String mainView = '/main_view';
  static const String loginView = '/login_view';
  static const String homeView = '/home_view';
  static const String registerView = '/register_view';
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
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.registerView:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.mainView:
        initMainModule();
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.homeView:
        return MaterialPageRoute(builder: (_) => HomeView());
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
