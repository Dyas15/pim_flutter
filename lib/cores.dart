import 'package:flutter/material.dart';
import 'home.dart';

class Cores extends StatelessWidget {
  const Cores({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Cores',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}