import 'package:flutter/material.dart';
import 'package:flutter_drawing/components/poligon-painter-side-width.dart';
import 'package:flutter_drawing/components/slide-shape-controls.dart';
// import 'package:flutter_drawing/components/line-painter.dart';
// import 'package:flutter_drawing/components/circle-painter.dart';
// import 'package:flutter_drawing/components/circle-path-painter.dart';
// import 'package:flutter_drawing/components/poligon-painter.dart';

class MyPainter extends StatefulWidget {
  const MyPainter({super.key});

  @override
  State<MyPainter> createState() => _MyPainterState();
}

class _MyPainterState extends State<MyPainter> {
  int _sides = 2;
  double _sideWidth = 100;

  void _setSides(int sides) {
    setState(() {
      _sides = sides;
    });
  }

  void _setSideWidth(double sideWidth) {
    setState(() {
      _sideWidth = sideWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Drawing'),
      ),
      body: CustomPaint(
        // painter: LinePainter(),
        // painter: CirclePainter(),
        // painter: CirclePathPainter(),
        // painter: PoligonPainter(sides: 6, radius: 10),
        painter:
            PoligonPainterSideWidth(sides: _sides, larguraLado: _sideWidth),
        child: SlideShapeControls(
          sides: _sides,
          sideWidth: _sideWidth,
          setSides: _setSides,
          setSideWidth: _setSideWidth,
        ),
      ),
    );
  }
}
