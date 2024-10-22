import 'package:flutter/material.dart';

class Produtos extends StatefulWidget {
  const Produtos({super.key});

  @override
  State<Produtos> createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(4, 56, 63, 1),
      body: Center(
        child: Text(
          'Página de Produtos',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
