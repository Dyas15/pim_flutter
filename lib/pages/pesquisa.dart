import 'package:flutter/material.dart';

class Pesquisa extends StatefulWidget {
  const Pesquisa({super.key});

  @override
  State<Pesquisa> createState() => _PesquisaState();
}

class _PesquisaState extends State<Pesquisa> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(4, 56, 63, 1),
      body: Center(
        child: Text(
          'Página de Pesquisa',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}