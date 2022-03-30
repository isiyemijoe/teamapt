import 'package:flutter/material.dart';
import 'package:teamapt/modules/home/views/home_page.dart';
import 'package:teamapt/modules/home/views/landing_page.dart';
import 'package:teamapt/modules/home/views/product_details_page.dart';
import 'package:teamapt/modules/home/views/splash_screen.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    SplashScreen.routeName: (context) => const SplashScreen(),
    LandingPage.routeName: (context) => const LandingPage(),
    Homepage.routeName: (context) => const Homepage(),
    ProductPage.routeName: (context) => const ProductPage(),
  };
}
