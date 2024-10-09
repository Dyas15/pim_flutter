import 'package:flutter/material.dart';
import 'package:teste/pages/esqueci-a-senha.dart';
import 'package:teste/pages/Login.dart';
import 'package:teste/pages/cadastro.dart';
import 'package:teste/pages/inicio.dart';

void trocarPagina(BuildContext context, String pagina) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        switch (pagina) {
          case 'registro':
            return const TelaDeCadastro();
          case 'login':
            return const Login();
          case 'esqueci':
            return const EsqueciASenha();
          case 'inicio':
            return const Inicio();
          default:
            return const Scaffold(
              body: Center(child: Text('Página não encontrada')),
            );
        }
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var inicio = 0.0;
        var fim = 1.0;
        var curve = Curves.easeInOut;

        var tween = Tween(begin: inicio, end: fim).chain(CurveTween(curve: curve));
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