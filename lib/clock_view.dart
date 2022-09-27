import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 300,
        child: CustomPaint(
          painter: ClockPainter(),
        ));
  }
}

class ClockPainter extends CustomPainter {
  // implement virtual and abstract methods

  @override
  void paint(Canvas canvas, Size size) {
    // calculate center point
    var centerX = size.width / 2;
    var centerY = size.height / 2;

    // variable to hold this offset
    var center = Offset(centerX, centerY);

    // radius of circle
    var radius = min(centerX, centerY); // gives minimum radius

    /* define a paintbrush */
    var fillBrush = Paint()
    // ..color = Color(0xFF444974);
    ..color = Color(0xFF444974);

    /* painting on the canvas */

    // draw a circle (center, radius, paint)
    canvas.drawCircle(center, radius-40, fillBrush);
    
  }

  // repaint whenever there is state change
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
