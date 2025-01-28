import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class clock_view extends StatefulWidget {
  final double size;
  const clock_view({super.key,required this.size});

  @override
  State<clock_view> createState() => _clock_viewState();
}

class _clock_viewState extends State<clock_view> {
  @override void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {

      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: widget.size,
        height: widget.size,
        child: Transform.rotate(
          angle: -pi / 2,
          child: CustomPaint(
            painter: ClockPainter(),
          ),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  var DaT= DateTime.now();
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);
    var paintBrush = Paint()..color = Color(0xFF444974);
    var outlineBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 20;
    var centerBrush = Paint()..color = Color(0xFFEAECFF);
    var secHand = Paint()
      ..color = Colors.orange.shade300
      ..style = PaintingStyle.stroke
      ..strokeCap=StrokeCap.round
      ..strokeWidth = size.width / 60;
    var minHand = Paint()
      ..shader = RadialGradient(colors: [Color(0xFF748EF6), Color(0xFF77DDFF)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap=StrokeCap.round
      ..strokeWidth = size.width / 30;
    var hourHand = Paint()
      ..shader = RadialGradient(colors: [Color(0xFFEA74AB), Color(0xFFC279FB)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap=StrokeCap.round
      ..strokeWidth = size.width / 24;
    var dashBrush = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    canvas.drawCircle(center, radius * 0.75, paintBrush);
    canvas.drawCircle(center, radius * 0.75, outlineBrush);
    var hourHandX= centerX + radius * 0.4 * cos((DaT.hour * 30 + DaT.minute * 0.5) * pi / 180);
    var hourHandY= centerX + radius * 0.4 * sin((DaT.hour * 30 + DaT.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHand);
    var minHandX= centerX + radius * 0.6 * cos(DaT.minute * 6 * pi / 180);
    var minHandY= centerX + radius * 0.6 * sin(DaT.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHand);
    var secHandX= centerX + radius * 0.6 * cos(DaT.second * 6 * pi / 180);
    var secHandY= centerX + radius * 0.6 * sin(DaT.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX,secHandY), secHand);
    canvas.drawCircle(center, radius * 0.12 , centerBrush);
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

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
