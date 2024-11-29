import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste/Provider/salvar.dart';
import 'package:teste/functions/API/clientes.dart';
import 'package:teste/functions/configuracao.dart';

class Configuracao extends StatefulWidget {
  const Configuracao({super.key});

  @override
  State<Configuracao> createState() => _ConfiguracaoState();
}

class _ConfiguracaoState extends State<Configuracao> {
  static const Color corPadrao = Color.fromRGBO(4, 56, 63, 1);
  static const Color corBranca = Colors.white;

  late Future<Map<String, dynamic>?> _clienteFuture;

  // Função para buscar os dados do cliente
  Future<Map<String, dynamic>?> _obterCliente(String cpf) async {
    try {
      final response = await ApiClientes().obterClientePorCPF(cpf);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    // Inicialização inicial do futuro, mas o `didChangeDependencies` fará o refetch quando necessário
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    String? cpf = loginProvider.cpf ?? '';
    _clienteFuture = _obterCliente(cpf);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Sempre que o contexto mudar (ex: ao voltar à tela), o futuro é reiniciado
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    String? cpf = loginProvider.cpf ?? '';
    _clienteFuture = _obterCliente(cpf);  // Reinicia a requisição sempre que a tela for exibida
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corPadrao,
      body: FutureBuilder<Map<String, dynamic>?>(  // Usando o `Future` atualizado
        future: _clienteFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar dados.'));
          }

          if (!snapshot.hasData) {
            return const Center(child: Text('Nenhum dado encontrado.'));
          }

          final dados = snapshot.data!;

          return Column(
            children: [
              const SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('images/logo_pequena.png'),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${dados['NOME']}",  // Exibe os dados carregados da API
                          style: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: corBranca,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Divider(color: Colors.grey[800], thickness: 1),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    // Aqui você pode substituir os dados estáticos pelo que vem da API
                    opcoesConfiguracao(context, Icons.person, 'Perfil', 'perfil'),
                    opcoesConfiguracao(context, Icons.attach_money,
                        'Formas de pagamento', 'formas_pagamento'),
                    opcoesConfiguracao(context, Icons.date_range,
                        'Histórico de compras', 'historico_compras'),
                    opcoesConfiguracao(
                        context, Icons.chat_bubble, 'Sobre Nós', 'sobre_nos'),
                    opcoesConfiguracao(
                        context, Icons.privacy_tip_rounded, 'Termos de uso', 'termos_de_uso'),
                    opcoesConfiguracao(
                        context, Icons.delete, 'Deletar Conta', 'deletar_conta'),
                    opcoesConfiguracao(context, Icons.logout, 'Sair', 'sair'),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
