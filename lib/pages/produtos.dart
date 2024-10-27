import 'dart:ffi';

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Produtos extends StatefulWidget {
  const Produtos({super.key});
 

  @override
  State<Produtos> createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
   TextEditingController textController = TextEditingController();

   List<Card> _buildGridCards(int count) {
    List<Card> cards = List.generate(
      count,
      (int  index) {
        return Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 18.0 / 11.0,
                child: Image.asset('images/logo_pequena.png'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 56, 63, 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text('Title'),
                      SizedBox(height: 8.0),
                      Text('Secondary text'),
                    ],
                  ),
                  ),
            ],
          ),
        );
      }
      );
      return cards;
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(4, 56, 63, 1),
     body:Container(
    color: Color.fromRGBO(4, 56, 63, 1),
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical:20, horizontal: 10),
    child: Column(
      children: [
       AnimSearchBar(width: 400,
        textController: textController, 
        onSuffixTap: (){
          setState(() {
            textController.clear();
          });
        },
        helpText: 'Pesquise!',
        autoFocus: true,
        closeSearchOnSuffixTap: true,
        animationDurationInMilli: 1000,
        onSubmitted:(String valor){} ,
        ),
        Expanded(
         child:  GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(16.0),
          childAspectRatio: 8.0 / 9.0,
          children: _buildGridCards(10),
          )
        )
      ]
    ),
    )
    );
  }
}
