import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Diogo Farms', style: TextStyle(color: Colors.white),),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: const Center(
          child: Text(
            'Como você enrola!',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
        backgroundColor: Color.fromRGBO(4, 56, 63, 1),
      );
  }
}
