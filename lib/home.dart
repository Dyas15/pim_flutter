import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Color> opcoesCorBarra = [
    Colors.green[900]!,
    Colors.red[900]!,
    Colors.blue[900]!,
    Colors.orange[900]!,
    Colors.purple[900]!
  ];
  
  List<Color> opcoesCorTexto = [
    Colors.green[800]!,
    Colors.red[800]!,
    Colors.blue[800]!,
    Colors.orange[800]!,
    Colors.purple[800]!
  ];
  
  List<Color> opcoesCorFundo = [
    Colors.green[50]!,
    Colors.red[50]!,
    Colors.blue[50]!,
    Colors.orange[50]!,
    Colors.purple[50]!
  ];
  
  List<String> cores = [
    'Verde',
    'Vermelho',
    'Azul',
    'Laranja',
    'Roxo'
  ];

  int opcaoAtual = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: opcoesCorFundo[opcaoAtual],
      appBar: AppBar(
        title: const Text('App com flutter :)'),
        backgroundColor: opcoesCorBarra[opcaoAtual],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              cores[opcaoAtual],
              style: TextStyle(fontSize: 50, color: opcoesCorTexto[opcaoAtual]),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  opcaoAtual = opcaoAtual < opcoesCorBarra.length - 1 ? ++opcaoAtual : 0;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: opcoesCorTexto[opcaoAtual],
                foregroundColor: Colors.white
              ),
              child: const Text(
                "Trocar cor",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}