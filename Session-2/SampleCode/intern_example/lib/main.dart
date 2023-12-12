import 'package:flutter/material.dart';
import 'package:intern_example/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
