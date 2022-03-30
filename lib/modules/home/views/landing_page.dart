import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teamapt/animation/slide_in_right.dart';
import 'package:teamapt/animation/slide_left_animation.dart';
import 'package:teamapt/modules/home/views/home_page.dart';
import 'package:teamapt/utils/colors.dart';
import 'package:teamapt/utils/helpers.dart';
import 'package:teamapt/utils/landing_painter.dart';

class LandingPage extends StatefulWidget {
  static const String routeName = "/landing_page";
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;

  Tween<double> _rotationTween = Tween(begin: 0.6, end: 1.0);

  @override
  void initState() {
    timeDilation = 2.5;

    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    animation = _rotationTween.animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        switch (status) {
          case AnimationStatus.completed:
            Navigator.pushNamed(context, Homepage.routeName);
            break;
          default:
        }
      });
  }

  _navigate() async {
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.yellow,
      body: SafeArea(
          child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Positioned.fill(
              child: SlideInLeftAnimation(
            delay: 0.9,
            child: Opacity(
              opacity: 1.0 - _animationController.value,
              child: CustomPaint(
                painter: MyPainter(scale: animation.value),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(),
                ),
              ),
            ),
          )),
          Positioned.fill(
            child: Column(
              children: [
                Container(),
                SlideInLeftAnimation(
                  delay: 0.5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Helpers.getAsset("logo.svg", isSvg: true),
                          height: 40,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        RichText(
                            text: TextSpan(
                                text: "team",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                children: [
                              TextSpan(
                                  text: "apt",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          color: AppColor.orange,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 25))
                            ]))
                      ],
                    ),
                  ),
                ),
                Spacer(),
                SlideInLeftAnimation(
                  delay: 0.6,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 20,
                        right: MediaQuery.of(context).size.width * 0.33),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Let's",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "decor",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                        ),
                        Text(
                          "your home",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1),
                        SlideInLeftAnimation(
                          delay: 0.7,
                          child: Text(
                            "Be faithful to your own taste because nothing you ever like is out of taste",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SlideInLeftAnimation(
                          delay: 1,
                          child: GestureDetector(
                            onTap: () {
                              _navigate();
                            },
                            child: SvgPicture.asset(
                              Helpers.getAsset("arrow.svg", isSvg: true),
                              height: 40,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1),
                      ],
                    ),
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
