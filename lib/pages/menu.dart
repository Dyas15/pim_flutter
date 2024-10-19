import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:teste/pages/carrinho.dart';
import 'package:teste/pages/configuracao.dart';
import 'package:teste/pages/pesquisa.dart';
import 'package:teste/pages/produtos.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final PageController _pageController = PageController();
  int _paginaAtual = 0;

  void _trocarPagina(int index) {
    setState(() {
      _paginaAtual = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _paginaAtual = index;
          });
        },
        children: const [
          Produtos(),
          Pesquisa(),
          Carrinho(),
          Configuracao()
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: const [
          Icon(Icons.home),
          Icon(Icons.search_sharp),
          Icon(Icons.shopping_cart),
          Icon(Icons.settings_sharp),
        ],
        index: _paginaAtual,
        height: 50,
        backgroundColor:const Color.fromRGBO(4, 56, 63, 1),
        onTap: _trocarPagina,
      ),
    );
  }
}