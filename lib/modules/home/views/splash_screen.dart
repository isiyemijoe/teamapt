import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teamapt/animation/fade_in_animation.dart';
import 'package:teamapt/modules/home/views/landing_page.dart';
import 'package:teamapt/utils/helpers.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "/splash_screen";
  const SplashScreen({Key? key}) : super(key: key);

  _navigate(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushNamed(context, LandingPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    _navigate(context);
    return Scaffold(
      body: FadeInAnimations(
        delay: 0.1,
        child: Center(
          child: SvgPicture.asset(
            Helpers.getAsset("logo.svg", isSvg: true),
            height: 70,
            width: 70,
          ),
        ),
      ),
    );
  }
}
