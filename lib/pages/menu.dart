import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:teste/pages/carrinho.dart';
import 'package:teste/pages/configuracao.dart';
import 'package:teste/pages/produtos.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> with TickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);
  int _paginaAtual = 0;
  late AnimationController _animacaoController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _paginaAtual = 0;
    _animacaoController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation =
        Tween<double>(begin: 1.0, end: 1.0).animate(_animacaoController);
  }

  void _trocarPagina(int index) {
    if (_paginaAtual == _pageController.page!.round() &&
        index == 0 &&
        _paginaAtual == 2) {
      _pageController.jumpToPage(0);
    } else if (_paginaAtual == _pageController.page!.round() &&
        index == 2 &&
        _paginaAtual == 0) {
      _pageController.jumpToPage(2);
    } else {
      setState(() {
        _paginaAtual = index;
      });
      _animacaoController.forward(from: 0.0).then((_) {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
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
              Carrinho(),
              Configuracao(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: const [
          Icon(Icons.home),
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
