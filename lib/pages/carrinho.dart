import 'package:flutter/material.dart';

class Carrinho extends StatefulWidget {
  const Carrinho({super.key});

  @override
  State<Carrinho> createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(4, 56, 63, 1),
      body: Center(
        child: Text(
          'Página de Carrinho',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}