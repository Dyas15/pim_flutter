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
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Usuário'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // lógica de autenticação
              },
              child: Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}