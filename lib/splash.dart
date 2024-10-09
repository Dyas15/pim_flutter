import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:teste/Inicio.dart';

class TelaSplash extends StatelessWidget {
  const TelaSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return const TelaSplashInicial();
  }
}

class TelaSplashInicial extends StatefulWidget {
  const TelaSplashInicial({super.key});

  @override
  EstadoTelaSplashInicial createState() => EstadoTelaSplashInicial();
}

class EstadoTelaSplashInicial extends State<TelaSplashInicial> {
  double _opacidade = 0.0;

  @override
  void initState() {
    super.initState();
    _animarLogo();
    _navegarParaPagina();
  }

  void _animarLogo() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacidade = 1.0;
      });
    });
  }

  void _navegarParaPagina() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      PageTransition(
        type: PageTransitionType.fade,
        child: const Inicio(),
        duration: const Duration(milliseconds: 1000),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacidade,
          duration: const Duration(seconds: 1),
          child: Image.asset('images/logo_pequena.png'),
        ),
      ),
    );
  }
}