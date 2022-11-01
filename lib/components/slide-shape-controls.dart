import 'package:flutter/material.dart';

class SlideShapeControls extends StatelessWidget {
  final List<Map<String, dynamic>> measures;
  const SlideShapeControls({super.key, required this.measures});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: measures.map(
      (measure) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              SizedBox(
                width: 150,
                child: Column(
                  children: [
                    Text(measure['label'] as String),
                    Text(
                        '(${measure['value'].toInt().toString()} ${measure['unidade'] ?? ''})')
                  ],
                ),
              ),
              Expanded(
                child: Slider(
                  value: measure['value'].toDouble(),
                  min: measure['minValue'].toDouble(),
                  max: measure['maxValue'].toDouble(),
                  // onChanged: (sides) => widget.setSides(sides.toInt()),
                  onChanged: measure['function'],
                ),
              ),
            ],
          ),
        );
      },
    ).toList());
  }
}
