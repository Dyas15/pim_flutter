import 'dart:ffi';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste/functions/criadorCard.dart';

class Produtos extends StatefulWidget {
  const Produtos({super.key});

  @override
  State<Produtos> createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(4, 56, 63, 1),
        body: Container(
          color: const Color.fromRGBO(4, 56, 63, 1),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(children: [
            AnimSearchBar(
              width: 400,
              textController: textController,
              onSuffixTap: () {
                setState(() {
                  textController.clear();
                });
              },
              helpText: 'Pesquise!',
              autoFocus: true,
              closeSearchOnSuffixTap: true,
              animationDurationInMilli: 1000,
              onSubmitted: (String valor) {},
            ),
            Expanded(
                child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16.0),
              childAspectRatio: 8.0 / 9.0,
              children: construirGridCards(10),
            ))
          ]),
        ));
  }
}
