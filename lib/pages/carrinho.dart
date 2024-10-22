import 'package:flutter/material.dart';

class Carrinho extends StatefulWidget {
  const Carrinho({super.key});

  @override
  State<Carrinho> createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  static const Color corPadrao = Color.fromRGBO(4, 56, 63, 1);
  static const Color corBranca = Colors.white;
  static const Color corBotaoFinalizar = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corPadrao,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Meu Carrinho',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(13.0),
            children: [
              const Divider(color: Colors.white, thickness: 1, indent: 10, endIndent: 10), // Ajuste do tamanho
              Card(
                color: corBranca,
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  leading: Image.asset('images/logo_pequena.png', width: 50, height: 50),
                  title: const Text(
                    'Alface',
                    style: TextStyle(color: corPadrao, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Preço: R\$ 15,00', style: TextStyle(color: corPadrao)),
                      SizedBox(height: 5),
                      Text('Quantidade: 1', style: TextStyle(color: corPadrao, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // Ação de remover item
                    },
                  ),
                ),
              ), 
              Card(
                color: corBranca,
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  leading: Image.asset('images/logo_pequena.png', width: 50, height: 50),
                  title: const Text(
                    'Alface',
                    style: TextStyle(color: corPadrao, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Preço: R\$ 15,00', style: TextStyle(color: corPadrao)),
                      SizedBox(height: 5),
                      Text('Quantidade: 1', style: TextStyle(color: corPadrao, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // Ação de remover item
                    },
                  ),
                ),
              ), 
              Card(
                color: corBranca,
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  leading: Image.asset('images/logo_pequena.png', width: 50, height: 50),
                  title: const Text(
                    'Alface',
                    style: TextStyle(color: corPadrao, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Preço: R\$ 15,00', style: TextStyle(color: corPadrao)),
                      SizedBox(height: 5),
                      Text('Quantidade: 1', style: TextStyle(color: corPadrao, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // Ação de remover item
                    },
                  ),
                ),
              ), 
              Card(
                color: corBranca,
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  leading: Image.asset('images/logo_pequena.png', width: 50, height: 50),
                  title: const Text(
                    'Alface',
                    style: TextStyle(color: corPadrao, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Preço: R\$ 15,00', style: TextStyle(color: corPadrao)),
                      SizedBox(height: 5),
                      Text('Quantidade: 1', style: TextStyle(color: corPadrao, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // Ação de remover item
                    },
                  ),
                ),
              ), 
              Card(
                color: corBranca,
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  leading: Image.asset('images/logo_pequena.png', width: 50, height: 50),
                  title: const Text(
                    'Alface',
                    style: TextStyle(color: corPadrao, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Preço: R\$ 15,00', style: TextStyle(color: corPadrao)),
                      SizedBox(height: 5),
                      Text('Quantidade: 1', style: TextStyle(color: corPadrao, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // Ação de remover item
                    },
                  ),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: corPadrao,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Total: R\$ 170.0',
                    style: TextStyle(
                      color: corBranca,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: corBotaoFinalizar,
                      foregroundColor: corBranca,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      // Ação de finalizar compra
                    },
                    child: const Text(
                      'Finalizar Compra',
                      style: TextStyle(fontSize: 19, color: corPadrao),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
