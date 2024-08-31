import 'package:flutter/material.dart';
import 'package:teste/widgets/home.dart';

class VidentApp extends StatelessWidget {
  const VidentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Vidente",
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}