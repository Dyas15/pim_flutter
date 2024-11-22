import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:teste/functions/API/logins.dart';
import 'dart:convert';
import 'package:teste/functions/API/redefinicao.dart';
import 'package:teste/functions/validarCPF.dart';

class EsqueciASenha extends StatefulWidget {
  const EsqueciASenha({super.key});

  @override
  _EsqueciASenhaState createState() => _EsqueciASenhaState();
}

class _EsqueciASenhaState extends State<EsqueciASenha> {
  final _cpfController = MaskedTextController(mask: '000.000.000-00');
  final ApiRedefinicao apiRedefinicao = ApiRedefinicao();
  final ApiLogins apiLogins = ApiLogins();

  void _enviarSolicitacao() async {
    String cpf = _cpfController.text.replaceAll(RegExp(r'[^\d]'), '');
    try {
      final loginResponse = await apiLogins.obterLogin(cpf);
      if (loginResponse.statusCode == 200) {
        final loginData = jsonDecode(loginResponse.body);

        if (loginData['CPF'] != null && loginData['EMAIL'] != null) {
          final redefinicaoDados = {
            "cpf": loginData['CPF'],
            "email": loginData['EMAIL'],
          };

          apiRedefinicao.enviarRedefinicao(redefinicaoDados);

          _mostrarDialog(
              'Solicitação enviada com sucesso! Verifique seu e-mail.',
              isError: false);
        } else {
          _mostrarDialog(
              'Não foi possível encontrar informações para este CPF.',
              isError: true);
        }
      } else {
        _mostrarDialog('Erro ao buscar informações do login.', isError: true);
      }
    } catch (e) {
      _mostrarDialog('Erro: $e', isError: true);
    }
  }

  void _mostrarDialog(String mensagem, {required bool isError}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isError ? 'Erro' : 'Sucesso'),
          content: Text(mensagem),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
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
        backgroundColor: const Color.fromRGBO(4, 56, 63, 1),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
        color: const Color.fromRGBO(4, 56, 63, 1),
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset('images/Cadeado.branco.png'),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            const Text(
              'Esqueceu sua senha?',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const Padding(padding: EdgeInsets.all(10)),
            const Text(
              'Por favor, informe o CPF associado a sua conta que enviaremos um link com as instruções para a restauração de sua senha.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const Padding(padding: EdgeInsets.all(10)),
            TextFormField(
              controller: _cpfController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                prefixIconColor: Colors.white,
                labelText: 'CPF',
                labelStyle: const TextStyle(color: Colors.white),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
              ),
              style: const TextStyle(color: Colors.white),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Digite o CPF!';
                }

                String cpf = value.replaceAll(RegExp(r'[^\d]'), '');

                if (validarCPF(cpf) == false) {
                  return 'Digite um CPF válido!';
                }
                return null;
              },
            ),
            const Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color.fromRGBO(4, 56, 63, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                fixedSize: const Size(200, 60),
              ),
              onPressed: _enviarSolicitacao,
              child: const Text(
                'Enviar',
                style: TextStyle(fontSize: 19),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
