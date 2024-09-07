import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart'; // Importa o pacote de transição
import 'login.dart';

void main() {
  runApp(const TelaSplash());
}

class TelaSplash extends StatelessWidget {
  const TelaSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela Splash',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TelaSplashInicial(),
    );
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
    _navegarParaLogin();
  }

  void _animarLogo() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacidade = 1.0;
      });
    });
  }

  void _navegarParaLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      PageTransition(
        type: PageTransitionType.fade, // Tipo de transição
        child: const Login(), // Tela de destino
        duration: const Duration(milliseconds: 1000), // Duração da transição
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