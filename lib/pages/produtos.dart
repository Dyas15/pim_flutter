import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Produtos extends StatefulWidget {
  const Produtos({super.key});

  @override
  State<Produtos> createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  final List<Widget> _items=[
    Icon(Icons.home),
    Icon(Icons.search_sharp),
    Icon(Icons.shopping_cart),
    Icon(Icons.settings_sharp),
    Icon(Icons.person),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(4, 56, 63, 1),
      body: Container(),
      bottomNavigationBar: CurvedNavigationBar(items: _items, backgroundColor: Color.fromRGBO(4, 56, 63, 1),height: 50,),

    );
  }
}
