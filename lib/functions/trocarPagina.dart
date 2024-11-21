import 'package:flutter/material.dart';
import 'package:teste/pages/Login.dart';
import 'package:teste/pages/cadastro.dart';
import 'package:teste/pages/esqueci-a-senha.dart';
import 'package:teste/pages/menu.dart';
import 'package:teste/pages/navegar.dart';
import 'package:teste/pages/perfil.dart';
import 'package:teste/pages/sobre-nos.dart';
import 'package:teste/pages/termos-uso.dart';

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
    case 'perfil':
      page = const Perfil();
      break;
      case 'sobre_nos':
      page = const SobreNos();
      break;
      case 'termos_de_uso':
      page = const TermosUso();
      break;
    case 'sair':
      Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const Navegar()),
        (Route<dynamic> route) => false,
      );
      return;
    case 'menu':
      Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const Menu()),
        (Route<dynamic> route) => false,
      );
      return;
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

        var tween =
            Tween(begin: inicio, end: fim).chain(CurveTween(curve: curve));
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
