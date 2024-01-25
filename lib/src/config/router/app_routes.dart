import 'package:felix_it_solutions_task/src/presentation/views/new_ads/new_ads_page.dart';
import 'package:felix_it_solutions_task/src/presentation/views/sign_in/sign_in_page.dart';
import 'package:felix_it_solutions_task/src/presentation/views/sign_up/sign_up_page.dart';
import 'package:felix_it_solutions_task/src/presentation/views/signin/signin_page.dart';
import 'package:flutter/material.dart';

class RouteNames {
  static const String splashScreen = "/";
  static const String signInPageSplash = "/sign_in_page_splash";
  static const String signUpPage = "/sign_up_page";
  static const String signInPage = "/sign_in_page";
  static const String newAds = "/new_ads";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SignInPageSplash(),
        );
      case RouteNames.signInPageSplash:
        return MaterialPageRoute(
          builder: (context) => const SignInPageSplash(),
        );
      case RouteNames.signUpPage:
        return MaterialPageRoute(
          builder: (context) => const SignUpPage(),
        );
      case RouteNames.signInPage:
        return MaterialPageRoute(
          builder: (context) => const SignInPage(),
        );

      case RouteNames.newAds:
        return MaterialPageRoute(
          builder: (context) => const NewAdsPage(),
        );
    }
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(child: Text("Route not found!")),
      ),
    );
  }
}
