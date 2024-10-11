

import 'package:flutter/material.dart';
import 'package:teste/pages/Login.dart';
import 'package:teste/pages/cadastro.dart';
import 'package:teste/pages/esqueci-a-senha.dart';
import 'package:teste/pages/inicio.dart';

void trocarPagina(BuildContext context, String pagina) {
  Widget page;

  switch (pagina) {
    case 'registro':
      page = const TelaDeCadastro();
      break;
    case 'login':
      page = const Login();
      break;
    case 'esqueci':
      page = const EsqueciASenha();
      break;
    case 'inicio':
      // Navigator.of(context).pushAndRemoveUntil(
      //   PageRouteBuilder(
      //     pageBuilder: (context, animation, secondaryAnimation) => const Inicio()
      //   ),
      //   (Route<dynamic> route) => false,
      // );
     // return;
     page = const Inicio();
    default:
      page = const Scaffold(
        body: Center(child: Text('Página não encontrada')),
      );
      break;
  }

  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
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
      transitionDuration: const Duration(milliseconds: 350),
    ),
  );
}
