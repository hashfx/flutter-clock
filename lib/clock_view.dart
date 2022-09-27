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
  var dateTime = DateTime.now();  // dateTime object gives current date and time
  

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
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    var minHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFF748EF6), Color(0xFF7700FF)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12;

    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFFEA74AB), Color(0xFFC279FB)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 16;

    /* painting on the canvas */

    // draw a circle (center, radius, paint)
    canvas.drawCircle(center, radius - 40, fillBrush);
    canvas.drawCircle(
        center, radius - 40, outlineBrush); // clock circle outline

    // draw hands of clock

    // automate hour hand of clock :: for radius, find a point on circumference
    var hourHandX = centerX + 60 * cos(180 * pi / 180);
    var hourHandY = centerX + 60 * sin(180 * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

// automate minute hand of clock :: for radius, find a point on circumference
    var minHandX = centerX + 80 * cos(45 * pi / 180);
    var minHandY = centerX + 80 * sin(45 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    // automate second hand of clock :: for radius, find a point on circumference
    var secHandX = centerX + 80 * cos(90 * pi / 180);
    var secHandY = centerX + 80 * sin(90 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    // center dot of clock
    canvas.drawCircle(center, 16, centerFillBrush);
  }

  // repaint whenever there is state change
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
