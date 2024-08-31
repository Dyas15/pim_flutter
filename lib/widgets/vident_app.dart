import 'package:flutter/material.dart';
import 'package:teste/controllers/tema_controller.dart';
import 'package:teste/widgets/home.dart';

class VidentApp extends StatelessWidget {
  const VidentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: TemaController.instancia,
        builder: (context, child) {
          return MaterialApp(
            title: "Vidente",
            theme: TemaController.instancia.usarTemaEscuro ? ThemeData.dark() : ThemeData.light(),
            debugShowCheckedModeBanner: false,
            home: Home(),
          );
        });
  }
}
