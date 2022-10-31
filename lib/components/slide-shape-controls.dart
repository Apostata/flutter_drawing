import 'package:flutter/material.dart';

class SlideShapeControls extends StatefulWidget {
  final int sides;
  final double sideWidth;
  final void Function(int) setSides;
  final void Function(double) setSideWidth;

  const SlideShapeControls({
    super.key,
    required this.sides,
    required this.sideWidth,
    required this.setSides,
    required this.setSideWidth,
  });

  @override
  State<SlideShapeControls> createState() => _SlideShapeControlsState();
}

class _SlideShapeControlsState extends State<SlideShapeControls> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              SizedBox(
                width: 100,
                child: Column(
                  children: [
                    const Text('Lados:'),
                    Text(widget.sides.toString())
                  ],
                ),
              ),
              Expanded(
                child: Slider(
                  value: widget.sides.toDouble(),
                  min: 2,
                  max: 360,
                  onChanged: (sides) => widget.setSides(sides.toInt()),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              SizedBox(
                width: 100,
                child: Column(
                  children: [
                    const Text('Tamanho lados:'),
                    Text('${widget.sideWidth.toInt().toString()} px')
                  ],
                ),
              ),
              Expanded(
                child: Slider(
                  value: widget.sideWidth,
                  min: 1,
                  max: 1000,
                  onChanged: widget.setSideWidth,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
