import 'package:flutter/material.dart';
import 'package:teste/pages/esqueci-a-senha.dart';
import 'package:teste/pages/menu.dart';
import 'package:teste/pages/navegar.dart';
import 'package:teste/pages/splash.dart';
import 'package:teste/pages/Login.dart';
import 'package:teste/pages/cadastro.dart';

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
        '/navegar': (context) => const Navegar(),
        '/menu': (context) => const Menu(),

        
        
      },
    );
  }
}
