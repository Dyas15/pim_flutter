import 'package:flutter/material.dart';
import 'package:teste/EsqueciASenha.dart';
import 'package:teste/Login.dart';
import 'package:teste/cadastro.dart';

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