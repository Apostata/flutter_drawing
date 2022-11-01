import 'package:flutter/material.dart';
import 'package:flutter_drawing/Pages/my-painter-view.dart';
import 'package:flutter_drawing/models/Measure.dart';

class MyPainter extends StatefulWidget {
  List<Map<String, dynamic>> controls;
  MyPainter({super.key, required this.controls});

  @override
  State<MyPainter> createState() => _MyPainterController();
}

class _MyPainterController extends State<MyPainter>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late List<Map<String, dynamic>> newMeasuresList;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: Duration(seconds: widget.controls[2]['value'].toInt()),
      vsync: this,
    )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _rotationController.repeat();
        }
      })
      ..forward();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  void _changeAnimationDuration(value) {
    _rotationController.stop();
    _rotationController.duration = Duration(seconds: value);
    _rotationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    newMeasuresList = widget.controls
        .map(
          (measure) => {
            ...measure,
            ...{
              'function': (num value) => {
                    if (measure['label'].contains('animação'))
                      {_changeAnimationDuration(measure['value'].toInt())},
                    setState(() => measure['value'] = value.toDouble()),
                  },
            }
          },
        )
        .toList();
    return MyPainterView(
        measures: newMeasuresList, rotationController: _rotationController);
  }
}
