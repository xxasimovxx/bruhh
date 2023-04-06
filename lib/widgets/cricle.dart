import 'dart:math';
import 'package:flutter/material.dart';

double strokeWidthMultiplier = 0.045;

class CircleDraw extends StatefulWidget {
  final double start_angle;
  final double sweep_angle;
  final double screen_width;
  final Color circle_color;

  const CircleDraw(
      {super.key,
      required this.start_angle,
      required this.sweep_angle,
      required this.screen_width,
      required this.circle_color});

  @override
  State<CircleDraw> createState() => _CircleDrawState();
}

class _CircleDrawState extends State<CircleDraw> {
  @override
  Widget build(BuildContext context) {
    double stroke_width = widget.screen_width * strokeWidthMultiplier;
    return CustomPaint(
      painter: CirclePainter(
          start_angle: widget.start_angle,
          sweep_angle: widget.sweep_angle,
          screen_width: widget.screen_width,
          stroke_width: stroke_width,
          circle_color: widget.circle_color),
    );
  }
}

class CirclePainter extends CustomPainter {
  final double start_angle;
  final double sweep_angle;
  final double screen_width;
  final double stroke_width;
  final Color circle_color;

  const CirclePainter({
    required this.start_angle,
    required this.sweep_angle,
    required this.screen_width,
    required this.stroke_width,
    required this.circle_color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromCenter(
        center: const Offset(0, 0),
        height: screen_width - 2.4 * stroke_width,
        width: screen_width - 2.4 * stroke_width);

    Rect borderRect = Rect.fromCenter(
        center: const Offset(0, 0),
        height: screen_width - 2.4 * stroke_width,
        width: screen_width - 2.4 * stroke_width);

    Paint paint1 = Paint()
      ..color = circle_color
      ..strokeWidth = stroke_width
      ..style = PaintingStyle.stroke;

    Paint paint2 = Paint()
      ..color = circle_color
      ..strokeWidth = stroke_width
      ..style = PaintingStyle.stroke;

    Paint borderPaint1 = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.3 * stroke_width
      ..style = PaintingStyle.stroke;

    Paint borderPaint2 = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.3 * stroke_width
      ..style = PaintingStyle.stroke;

    canvas.drawArc(borderRect, start_angle - pi / 180, sweep_angle + pi / 90,
        false, borderPaint1);
    canvas.drawArc(borderRect, start_angle + pi - pi / 180,
        sweep_angle + pi / 90, false, borderPaint2);
    canvas.drawArc(rect, start_angle, sweep_angle, false, paint1);
    canvas.drawArc(rect, start_angle + pi, sweep_angle, false, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
