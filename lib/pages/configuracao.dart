import 'package:flutter/material.dart';
import 'package:teste/functions/configuracao.dart';

class Configuracao extends StatelessWidget {
  static const Color corPadrao = Color.fromRGBO(4, 56, 63, 1);
  static const Color corBranca = Colors.white;

  const Configuracao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corPadrao,
      body: Column(
        children: [
          const SizedBox(height: 70),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/logo_pequena.png'),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Admin da Silva',
                      style: TextStyle(
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
                opcoesConfiguracao(context, Icons.person, 'Perfil', 'perfil'),
                opcoesConfiguracao(context, Icons.attach_money,
                    'Formas de pagamento', 'formas_pagamento'),
                opcoesConfiguracao(context, Icons.date_range,
                    'Histórico de compras', 'historico_compras'),
                opcoesConfiguracao(
                    context, Icons.chat_bubble, 'Sobre Nós', 'sobre_nos'),
                opcoesConfiguracao(context, Icons.privacy_tip_rounded,
                    'Termos de uso', 'termos_de_uso'),
                opcoesConfiguracao(
                    context, Icons.delete, 'Deletar Conta', 'deletar_conta'),
                opcoesConfiguracao(context, Icons.logout, 'Sair', 'sair'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
