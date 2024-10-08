import 'package:flutter/material.dart';
import 'package:teste/EsqueciASenha.dart';
import 'package:teste/Inicio.dart';
import 'package:teste/splash.dart';
import 'package:teste/Login.dart';
import 'package:teste/Cadastro.dart';

void main() {
  runApp(const DiogoFarms());
}

class DiogoFarms extends StatelessWidget {
  const DiogoFarms({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diogo Farms',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const TelaSplash(),
        '/login': (context) => const Login(),
        '/registro': (context) => const TelaDeCadastro(),
        '/esqueci': (context) => const EsqueciASenha(),
        '/Inicio': (context) => const Inicio()
      },
    );
  }
}
