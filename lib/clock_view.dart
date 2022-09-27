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

    // circle
    var fillBrush = Paint()..color = Color(0xFF444974);
    // circle outline
    var outlineBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;
    // center dot of clock
    var centerFillBrush = Paint()..color = Color(0xFFEAECFF);
    // hands of clock
    var secHandBrush = Paint()
      ..color = Colors.orange[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;

    var minHandBrush = Paint()
      ..shader = RadialGradient(colors: [Colors.lightBlue, Colors.pink])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;

    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [Colors.lightBlue, Colors.pink])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;

    /* painting on the canvas */

    // draw a circle (center, radius, paint)
    canvas.drawCircle(center, radius - 40, fillBrush);
    canvas.drawCircle(center, radius - 40, outlineBrush);
    canvas.drawCircle(center, 16, centerFillBrush);
    // draw hands of clock
    canvas.drawLine(center, Offset(100, 100), secHandBrush);
  }

  // repaint whenever there is state change
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
