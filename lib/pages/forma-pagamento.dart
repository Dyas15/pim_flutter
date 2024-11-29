import 'package:flutter/material.dart';

class CarrinhoItem {
  final String nome;
  final double preco;
  int quantidade;

  CarrinhoItem({
    required this.nome,
    required this.preco,
    this.quantidade = 1,
  });

  double totalPreco() {
    return preco * quantidade;
  }
}

class FormasPagamento extends StatefulWidget {
  const FormasPagamento({super.key});

  @override
  State<FormasPagamento> createState() => _FormasPagamentoState();
}

class _FormasPagamentoState extends State<FormasPagamento> {
  // Lista de itens no carrinho
  final List<CarrinhoItem> carrinhoItems = [
    CarrinhoItem(
      nome: 'Tomate',
      preco: 4.50,
      quantidade: 2,
    ),
    CarrinhoItem(nome: 'Alface', preco: 2.30, quantidade: 1),
    CarrinhoItem(nome: 'Cenoura', preco: 3.00, quantidade: 3),
  ];

  // Remove um item do carrinho
  void removeItem(CarrinhoItem item) {
    setState(() {
      carrinhoItems.remove(item);
    });
  }

  // Calcula o total do carrinho
  double calcularTotal() {
    return carrinhoItems.fold(0, (total, item) => total + item.totalPreco());
  }

  // Exibe o diálogo de confirmação de pedido
  Future<bool?> confirmarPedido() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirmação'),
          content: const Text('Deseja finalizar o pedido?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text(
                'Não',
                style: TextStyle(
                  color: Color.fromRGBO(4, 56, 63, 1),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Sim',
                  style: TextStyle(
                    color: Color.fromRGBO(4, 56, 63, 1),
                  )),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Carrinho', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(4, 56, 63, 1),
      ),
      backgroundColor: const Color.fromRGBO(4, 56, 63, 1),
      body: Column(
        children: [
          // Lista de itens no carrinho
          Expanded(
            child: carrinhoItems.isEmpty
                ? const Center(
                    child: Text(
                      'Seu carrinho está vazio!',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: carrinhoItems.length,
                    itemBuilder: (context, index) {
                      final item = carrinhoItems[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(31, 233, 230, 230),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ListTile(
                              textColor: Colors.white,
                              title: Text(item.nome),
                              subtitle: Text(
                                  '${item.quantidade}x R\$ ${item.preco.toStringAsFixed(2)}'),
                              trailing: IconButton(
                                color: Colors.red,
                                icon: const Icon(Icons.delete),
                                onPressed: () => removeItem(item),
                              ),
                            )),
                      );
                    },
                  ),
          ),

          // Resumo do carrinho e botão de finalizar pedido
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Valor Total',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'R\$ ${calcularTotal().toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 32,
                    color: Color.fromRGBO(4, 56, 63, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: const Color.fromRGBO(4, 56, 63, 1),
                    ),
                    onPressed: carrinhoItems.isEmpty
                        ? null
                        : () async {
                            final confirmado = await confirmarPedido();
                            if (confirmado ?? false) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Pedido Confirmado'),
                                    content: const Text(
                                        'Seu pedido foi finalizado com sucesso!'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: const Text(
                                          'OK',
                                          style: TextStyle(
                                            color: Color.fromRGBO(4, 56, 63, 1),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                    child: const Text(
                      'Finalizar Pedido',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
