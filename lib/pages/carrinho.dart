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

  // Lista de itens do carrinho
  final List<Map<String, dynamic>> _itensCarrinho = [
    {"nome": "Alface", "preco": 15.0, "quantidade": 1},
    {"nome": "Cenoura", "preco": 10.0, "quantidade": 2},
    {"nome": "Tomate", "preco": 20.0, "quantidade": 1},
  ];

  // Calcula o total do carrinho
  double _calcularTotal() {
    return _itensCarrinho.fold(
      0.0,
      (soma, item) => soma + (item["preco"] * item["quantidade"]),
    );
  }

  // Remove um item do carrinho
  void _removerItem(int index) {
    setState(() {
      _itensCarrinho.removeAt(index);
    });
  }

  // Mostra opções de pagamento
  void _mostrarOpcoesPagamento() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Escolha o método de pagamento',style: TextStyle(color: Color.fromRGBO(4, 56, 63, 1))),
        content: const Text('Selecione como deseja pagar:'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _mostrarFormularioCartao();
            },
            child: const Text('Cartão', style: TextStyle(color: Color.fromRGBO(4, 56, 63, 1)),),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Pagamento em Dinheiro', style: TextStyle(color: Color.fromRGBO(4, 56, 63, 1))),
                  content: const Text(
                      'Aguardaremos o pagamento em dinheiro na entrega.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Fechar', style: TextStyle(color: Color.fromRGBO(4, 56, 63, 1))),
                    ),
                  ],
                ),
              );
            },
            child: const Text('Dinheiro', style: TextStyle(color: Color.fromRGBO(4, 56, 63, 1))),
          ),
        ],
      ),
    );
  }

  // Mostra formulário de cartão
  void _mostrarFormularioCartao() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pagamento com Cartão',style: TextStyle(color: Color.fromRGBO(4, 56, 63, 1))),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Número do Cartão',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Nome no Cartão',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Validade (MM/AA)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Código de Segurança (CVV)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar',style: TextStyle(color: Color.fromRGBO(4, 56, 63, 1))),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Pagamento Confirmado!'),
                  content: const Text('Compra realizada com sucesso.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Fechar', style: TextStyle(color: Color.fromRGBO(4, 56, 63, 1))),
                    ),
                  ],
                ),
              );
            },
            child: const Text('Confirmar', style: TextStyle(color: Color.fromRGBO(4, 56, 63, 1)),),
          ),
        ],
      ),
    );
  }

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
          ListView.builder(
            padding: const EdgeInsets.all(13.0),
            itemCount: _itensCarrinho.length,
            itemBuilder: (context, index) {
              final item = _itensCarrinho[index];
              return Card(
                color: corBranca,
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  leading: Image.asset(
                    'images/logo_pequena.png',
                    width: 50,
                    height: 50,
                  ),
                  title: Text(
                    item["nome"],
                    style: const TextStyle(
                      color: corPadrao,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Preço: R\$ ${item["preco"].toStringAsFixed(2)}',
                        style: const TextStyle(color: corPadrao),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Quantidade: ${item["quantidade"]}',
                        style: const TextStyle(
                          color: Color.fromRGBO(4, 56, 63, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _removerItem(index),
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color:Color.fromRGBO(4, 56, 63, 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Total: R\$ ${_calcularTotal().toStringAsFixed(2)}',
                    style: const TextStyle(
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
                    onPressed: _mostrarOpcoesPagamento,
                    child: const Text(
                      'Finalizar Compra',
                      style: TextStyle(fontSize: 19, color: Color.fromRGBO(4, 56, 63, 1)),
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
