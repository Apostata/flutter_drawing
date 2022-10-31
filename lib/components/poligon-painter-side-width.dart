import 'dart:math';
import 'package:flutter/material.dart';

class PoligonPainterSideWidth extends CustomPainter {
  int sides;
  double larguraLado;
  PoligonPainterSideWidth({
    required this.sides,
    required this.larguraLado,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Path path = Path();
    double angle = (pi * 2) / sides;
    double halfAngle = angle / 2;
    double halfSide = larguraLado / 2;
    double radius = halfSide / sin(halfAngle);
    Offset center = Offset(size.width / 2, size.height / 2);
    Offset startingPoint = Offset(radius * cos(0.0), radius * sin(0.0));

    path.moveTo(
        startingPoint.dx + center.dx,
        startingPoint.dy +
            center.dy); // movendo do ponto x=0 para centro e y=0 para centro

    for (int i = 1; i <= sides; i++) {
      double x = radius * cos(angle * i) + center.dx;
      double y = radius * sin(angle * i) + center.dy;

      path.lineTo(x, y);
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
