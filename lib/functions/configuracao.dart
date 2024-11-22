import 'package:flutter/material.dart';
import 'package:teste/functions/trocarPagina.dart';
import 'package:teste/functions/API/clientes.dart';

const Color corPadrao = Color.fromRGBO(4, 56, 63, 1);
const Color corBranca = Colors.white;

ListTile opcoesConfiguracao(
      BuildContext context, IconData icon, String title, String page) {
    if (title == 'Deletar Conta') {
      return ListTile(
        leading: Icon(icon, color: corBranca),
        title:
            Text(title, style: const TextStyle(color: corBranca, fontSize: 18)),
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text('Deletar conta'),
                    content: const Text(
                        'Tem certeza que deseja deletar sua conta? Essa ação é irreversivel e não poderá ser desfeita.'),
                    actions: [
                      TextButton(
                          onPressed: () => {print('oi')},
                          child: const Text(
                            'Deletar dados',
                            style: TextStyle(color: Colors.black),
                          )),
                      TextButton(
                          onPressed: () => {Navigator.pop(context)},
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(color: Colors.red),
                          ))
                    ],
                  ));
        },
      );
    } else if (title == 'Sair') {
      return ListTile(
        leading: Icon(icon, color: corBranca),
        title:
            Text(title, style: const TextStyle(color: corBranca, fontSize: 18)),
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text('Sair'),
                    content:
                        const Text('Tem certeza que deseja sair da sua conta?'),
                    actions: [
                      TextButton(
                          onPressed: () => {trocarPagina(context, page)},
                          child: const Text(
                            'Sim',
                            style: TextStyle(color: Colors.black),
                          )),
                      TextButton(
                          onPressed: () => {Navigator.pop(context)},
                          child: const Text(
                            'Não',
                            style: TextStyle(color: Colors.red),
                          ))
                    ],
                  ));
        },
      );
    } else {
      return ListTile(
        leading: Icon(icon, color: corBranca),
        title:
            Text(title, style: const TextStyle(color: corBranca, fontSize: 18)),
        onTap: () {
          trocarPagina(context, page);
        },
      );
    }
  }