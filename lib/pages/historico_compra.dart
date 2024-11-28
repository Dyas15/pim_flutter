import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

class HistoricoCompra extends StatefulWidget {
  const HistoricoCompra({Key? key}) : super(key: key);

  @override
  State<HistoricoCompra> createState() => _HistoricoCompraState();
}

class _HistoricoCompraState extends State<HistoricoCompra> {
  TextEditingController searchController = TextEditingController();
  // List<dynamic> pedidos = appData.orders; // Mock inicial de pedidos
  List<dynamic> pedidosFiltrados = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _carregarPedidos();
  }

  Future<void> _carregarPedidos() async {
    // Simula o carregamento de dados (aqui poderia ser uma API real)
    await Future.delayed(const Duration(seconds: 1)); // Simulação de delay
    setState(() {
      // pedidosFiltrados = pedidos;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(4, 56, 63, 1), // Cor do background principal
      appBar: AppBar(
        title: const Text('Histórico de compras', style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromRGBO(4, 56, 63, 1), // Cor do AppBar
         iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: const Color.fromRGBO(4, 56, 63, 1), // Cor do Container principal
        child: Column(
          children: [
            Expanded(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white, // Cor do indicador de progresso
                      ),
                    )
                  : pedidosFiltrados.isEmpty
                      ? const Center(
                          child: Text(
                            'Nenhum pedido encontrado',
                            style: TextStyle(color: Colors.white), // Texto visível no fundo escuro
                          ),
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.all(18),
                          physics: const BouncingScrollPhysics(),
                          separatorBuilder: (_, index) =>
                              const SizedBox(height: 10),
                          itemCount: pedidosFiltrados.length,
                          itemBuilder: (_, index) {
                            final pedido = pedidosFiltrados[index];
                            return Card(
                              color: const Color.fromRGBO(4, 56, 63, 1), // Fundo do Card
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                title: Text(
                                  'Pedido ${pedido['id']}',
                                  style: const TextStyle(color: Colors.white), // Cor do texto
                                ),
                                subtitle: Text(
                                  'Status: ${pedido['status']}',
                                  style: const TextStyle(color: Colors.white), // Cor do texto
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.more_vert, color: Colors.white), // Ícone com cor branca
                                  onPressed: () {
                                    // Exibe detalhes do pedido (adapte conforme necessário)
                                    showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                        backgroundColor: const Color.fromRGBO(
                                            4, 56, 63, 1), // Fundo do diálogo
                                        title: Text(
                                          'Detalhes do Pedido ${pedido['id']}',
                                          style: const TextStyle(
                                              color: Colors.white), // Cor do título
                                        ),
                                        content: Text(
                                          'Status: ${pedido['status']}\nItens: ${pedido['items'].length}',
                                          style: const TextStyle(
                                              color: Colors.white), // Cor do conteúdo
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
