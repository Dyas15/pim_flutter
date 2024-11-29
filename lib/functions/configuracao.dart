import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste/Provider/salvar.dart';
import 'package:teste/functions/API/clientes.dart';
import 'package:teste/functions/trocarPagina.dart';

const Color corPadrao = Color.fromRGBO(4, 56, 63, 1);
const Color corBranca = Colors.white;

Future<Map<String, dynamic>?> _apagarCliente(String cpf) async {
  try {
    final response = await ApiClientes().deletarCliente(cpf);

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

ListTile opcoesConfiguracao(
    BuildContext context, IconData icon, String title, String page) {
  final loginProvider = Provider.of<LoginProvider>(context);
  String? cpf = loginProvider.cpf;

  if (title == 'Deletar Conta') {
    return ListTile(
      leading: Icon(icon, color: corBranca),
      title: Text(title, style: const TextStyle(color: corBranca, fontSize: 18)),
      onTap: () async {
        // Mostra o diálogo para confirmação de deleção
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Deletar conta'),
            content: const Text(
                'Tem certeza que deseja deletar sua conta? Essa ação é irreversível e não poderá ser desfeita.'),
            actions: [
              TextButton(
                  onPressed: () async {
                    final data = await _apagarCliente(cpf ?? '');

                    if (data != null) {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Conta apagada'),
                          content: const Text(
                              'Sua conta foi apagada com sucesso. Redirecionando para o login.'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  loginProvider.limparLogin();
                                  trocarPagina(context, 'sair');
                                },
                                child: const Text('OK')),
                          ],
                        ),
                      );
                    } else {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Erro'),
                          content: const Text('Não foi possível deletar sua conta.'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('OK')),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Deletar dados',
                    style: TextStyle(color: Colors.black),
                  )),
              TextButton(
                  onPressed: () => {Navigator.pop(context)}, // Fecha o diálogo de deleção
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.red),
                  )),
            ],
          ),
        );
      },
    );
  } else if (title == 'Sair') {
    return ListTile(
      leading: Icon(icon, color: corBranca),
      title: Text(title, style: const TextStyle(color: corBranca, fontSize: 18)),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Sair'),
            content: const Text('Tem certeza que deseja sair da sua conta?'),
            actions: [
              TextButton(
                  onPressed: () => {trocarPagina(context, page)},
                  child: const Text(
                    'Sim',
                    style: TextStyle(color: Colors.black),
                  )),
              TextButton(
                  onPressed: () => {Navigator.pop(context)}, // Fecha o diálogo de saída
                  child: const Text(
                    'Não',
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          ),
        );
      },
    );
  } else {
    return ListTile(
      leading: Icon(icon, color: corBranca),
      title: Text(title, style: const TextStyle(color: corBranca, fontSize: 18)),
      onTap: () {
        trocarPagina(context, page);
      },
    );
  }
}
