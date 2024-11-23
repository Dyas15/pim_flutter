import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:teste/functions/API/produtos.dart';
import 'package:teste/functions/criadorCard.dart';
import 'dart:convert';

class Produtos extends StatefulWidget {
  const Produtos({super.key});

  @override
  State<Produtos> createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  TextEditingController textController = TextEditingController();
  List<dynamic> produtos = [];
  List<dynamic> produtosFiltrados = [];
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    _carregarProdutos();
  }

  Future<void> _carregarProdutos() async {
    try {
      final response = await ApiProdutos().obterProdutos();
      if (response.statusCode == 200) {
        setState(() {
          produtos = jsonDecode(response.body);
          produtosFiltrados = produtos;
          isLoading = false;
        });
      } else {
        throw Exception('Erro ao buscar produtos: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        hasError = true;
      });
    }
  }

  void _filtrarProdutos(String query) {
    setState(() {
      if (query.isEmpty) {
        produtosFiltrados = produtos;
      } else {
        produtosFiltrados = produtos
            .where((produto) => (produto['NOME_PRODUTO'] ?? '')
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(4, 56, 63, 1),
      body: Container(
        color: const Color.fromRGBO(4, 56, 63, 1),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            AnimSearchBar(
              width: 400,
              textController: textController,
              onSuffixTap: () {
                setState(() {
                  textController.clear();
                  _filtrarProdutos('');
                });
              },
              helpText: 'Pesquise!',
              autoFocus: true,
              closeSearchOnSuffixTap: true,
              animationDurationInMilli: 1000,
              onSubmitted: (String valor) {
                _filtrarProdutos(valor);
              },
            ),
            Expanded(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : hasError
                      ? const Center(
                          child: Text(
                            'Erro ao carregar produtos',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : produtosFiltrados.isEmpty
                          ? const Center(
                              child: Text(
                                'Nenhum produto encontrado',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          : GridView.count(
                              crossAxisCount: 2,
                              padding: const EdgeInsets.all(16.0),
                              childAspectRatio: 8.0 / 9.0,
                              children: construirGridCards(produtosFiltrados),
                            ),
            )
          ],
        ),
      ),
    );
  }
}
