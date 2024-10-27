import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:teste/pages/carrinho.dart';
import 'package:teste/pages/configuracao.dart';
import 'package:teste/pages/pesquisa.dart';
import 'package:teste/pages/produtos.dart';
// ignore: depend_on_referenced_packages
import "package:intl/intl.dart";

import 'model/product.dart';
import 'model/products_repository.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _paginaAtual = 0;
  late AnimationController _animacaoController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animacaoController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animacaoController,
      curve: Curves.easeInOut,
    );
  }

  void _trocarPagina(int index) {
    setState(() {
      _paginaAtual = index;
    });
    _animacaoController.forward(from: 0.0);
    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _animacaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(4, 56, 63, 1),
        child: FadeTransition(
          opacity: _animation,
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _paginaAtual = index;
              });
            },
            children: const [
              Produtos(),
              // Pesquisa(),
              Carrinho(),
              Configuracao(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: const [
          Icon(Icons.home),
          // Icon(Icons.search_sharp),
          Icon(Icons.shopping_cart),
          Icon(Icons.settings_sharp),
        ],
        index: _paginaAtual,
        height: 55,
        backgroundColor: const Color.fromRGBO(4, 56, 63, 1),
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        onTap: _trocarPagina,
      ),
    );
  }
}
