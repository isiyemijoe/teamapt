import 'dart:math';

import 'package:flutter/material.dart';
import 'package:teamapt/utils/colors.dart';

class MyPainter extends CustomPainter {
  final double scale;
  MyPainter({required this.scale});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = AppColor.orange;

    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width * 0.2, (size.height * 0.6)),
          // height: size.height,
          // width: size.width,
          radius: size.width * scale),
      pi + 1.57,
      80,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
