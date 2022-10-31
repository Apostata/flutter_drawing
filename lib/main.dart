import 'package:flutter/material.dart';
import 'package:flutter_drawing/Pages/my-painter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyPainter(),
      debugShowCheckedModeBanner: false,
    );
  }
}
