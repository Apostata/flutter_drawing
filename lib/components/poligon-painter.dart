import 'dart:math';
import 'package:flutter/material.dart';

class PoligonPainter extends CustomPainter {
  int sides;
  double radius;
  PoligonPainter({
    required this.sides,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Path path = Path();

    double angle = (pi * 2) / sides;
    // 2 * pi = 360º em radianos
    // logo  2 * pi / sides = ângulo de cada lado do poligono
    Offset center = Offset(size.width / 2, size.height / 2);
    Offset startingPoint = Offset(radius * cos(0.0), radius * sin(0.0));
    /*
        0(sen 0)  = x / r  =>  se raio = 100  =>  0 = x / 100  =>  x = 0
        1(cos 0) = r / y   =>  se raio = 100  =>  1 = y / 100  =>  y = 100
     */
    // cosseno de 0º = 0, seno de 0º = 1

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
