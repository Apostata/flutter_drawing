import 'package:flutter/material.dart';
import 'package:flutter_drawing/components/poligon-painter-side-width.dart';
import 'package:flutter_drawing/components/slide-shape-controls.dart';
import 'package:flutter_drawing/models/Measure.dart';

class MyPainterView extends StatelessWidget {
  final List<Map<String, dynamic>> measures;
  final AnimationController rotationController;
  const MyPainterView({
    super.key,
    required this.measures,
    required this.rotationController,
  });

  @override
  Widget build(BuildContext context) {
    int sides = measures[0]['value'].toInt();
    double larguraLado = measures[1]['value'].toDouble();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Drawing'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SlideShapeControls(measures: measures),
          Expanded(
            child: RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(rotationController),
              child: CustomPaint(
                painter: PoligonPainterSideWidth(
                  sides: sides,
                  larguraLado: larguraLado,
                ),
                child: Container(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
