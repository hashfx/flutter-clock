import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {

  // customize clock size as per screen size
  final double size;
  const ClockView({Key? key, required this.size}) : super(key: key);


  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  // animate clock w.r.t. time
  @override
  void initState() {
    // run timer after each second
    Timer.periodic(Duration(seconds: 1), (timer) {
      // update entire state UI automatically
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.size,
        height: widget.size,
        child: Transform.rotate(
          angle: -pi / 2, // rotate canvas by deg90 anti-clockwise
          child: CustomPaint(
            painter: ClockPainter(),
          ),
        ));
  }
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now(); // dateTime object gives current date and time

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
      ..strokeWidth = size.width / 20;
    // center dot of clock
    var centerFillBrush = Paint()..color = Color(0xFFEAECFF);
    // hands of clock
    var secHandBrush = Paint()
      ..color = Colors.orange[300]!
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 60;

    var minHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFF748EF6), Color(0xFF7700FF)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 30;

    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xFFEA74AB), Color(0xFFC279FB)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 24;

    /* painting on the canvas */

    // draw a circle (center, radius, paint)
    canvas.drawCircle(center, radius * 0.75, fillBrush);
    canvas.drawCircle(
        center, radius * 0.75, outlineBrush); // clock circle outline

    // draw hands of clock

    // automate hour hand of clock :: for radius, find a point on circumference
    var hourHandX = centerX +
        radius * 0.4 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourHandY = centerX +
        radius * 0.4 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

// automate minute hand of clock :: for radius, find a point on circumference
    var minHandX = centerX + radius * 0.6 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + radius * 0.6 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    // automate second hand of clock :: for radius, find a point on circumference
    var secHandX = centerX + radius * 0.6 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerX + radius * 0.6 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    // center dot of clock
    canvas.drawCircle(center, radius * 0.12, centerFillBrush);

    // outer dashes of clock
    var dashBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    var outerCircleRadius = radius;
    var innerCircleRadius = radius * 0.9;
    for (double i = 0; i < 360; i += 12) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerX + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerX + innerCircleRadius * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  // repaint whenever there is state change
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
