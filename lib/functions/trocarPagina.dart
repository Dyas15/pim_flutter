import 'package:flutter/material.dart';
import 'package:teste/forgotPassword.dart';
import 'package:teste/login.dart';
import 'package:teste/register.dart';

void trocarPagina(BuildContext context, String pagina) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        switch (pagina) {
          case 'register':
            return const RegisterScreen();
          case 'login':
            return const Login();
          case 'forgot':
            return const Forgotpassword();
          default:
            return const Scaffold(
              body: Center(child: Text('Página não encontrada')),
            );
        }
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = 0.0;
        var end = 1.0;
        var curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var fadeAnimation = animation.drive(tween);

        return FadeTransition(
          opacity: fadeAnimation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 150),
    ),
  );
}