import 'package:flutter/material.dart';
import 'package:flutter_drawing/Pages/my-painter.dart';

void main() {
  runApp(const MyApp());
}

List<Map<String, dynamic>> json = [
  {
    'label': 'Quantidade de lados',
    'value': 4,
    'minValue': 2,
    'maxValue': 360,
    'unidade': null
  },
  {
    'label': 'Largura dos lados',
    'value': 100,
    'minValue': 1,
    'maxValue': 1000,
    'unidade': 'px'
  },
  {
    'label': 'Duração da animação',
    'value': 5,
    'minValue': 1,
    'maxValue': 10,
    'unidade': 's'
  }
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyPainter(
        controls: json,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
