import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

import 'bottom_up_animations.dart';

class SlideInLeftAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  final Curve curve;

  const SlideInLeftAnimation(
      {Key? key,
      required this.delay,
      required this.child,
      this.curve = Curves.bounceOut})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _tween = TimelineTween<AniProp>()
      ..addScene(begin: 0.milliseconds, duration: 500.milliseconds)
      //  .animate(AniProp.opacity, tween: 0.0.tweenTo(1.0))
      ..addScene(begin: 0.milliseconds, end: 500.milliseconds).animate(
        AniProp.translateX,
        tween: (-MediaQuery.of(context).size.width).tweenTo(0.0),
        curve: curve,
      );

    return PlayAnimation<TimelineValue<AniProp>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: _tween.duration,
      child: child,
      tween: _tween,
      builder: (context, child, value) => Transform.translate(
          offset: Offset(value.get(AniProp.translateX), 0), child: child),
    );
  }
}
