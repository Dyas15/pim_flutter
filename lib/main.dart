import 'package:flutter/material.dart';
import 'package:teste/forgotPassword.dart';
import 'package:teste/splash.dart';
import 'package:teste/login.dart';  // Certifique-se de que está importando suas telas
import 'package:teste/register.dart';

void main() {
  runApp(const diogoFarms());
}

class diogoFarms extends StatelessWidget {
  const diogoFarms({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diogo Farms',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const TelaSplash(),
        '/login': (context) => const Login(),
        '/register': (context) => const RegisterScreen(),
        '/forgot': (context) => const Forgotpassword()
      },
    );
  }
}
