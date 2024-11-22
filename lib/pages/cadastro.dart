import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:teste/functions/API/clientes.dart';
import 'package:teste/functions/API/logins.dart';
import 'package:teste/functions/configuracao.dart';
import 'package:teste/functions/validarCPF.dart';

class TelaDeCadastro extends StatefulWidget {
  const TelaDeCadastro({super.key});

  @override
  State<TelaDeCadastro> createState() => _TelaDeCadastroState();
}

class _TelaDeCadastroState extends State<TelaDeCadastro> {
  bool _mostrarSenha = true;
  final mascaraTelefone = MaskedTextController(mask: '(00) 00000-0000');
  final mascaraCPF = MaskedTextController(mask: '000.000.000-00');

  final apiClientes = ApiClientes();
  final apiLogins = ApiLogins();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  void _toggleSenha() {
    setState(() {
      _mostrarSenha = !_mostrarSenha;
    });
  }

  // Função para mostrar o pop-up
  void _mostrarDialog(String mensagem, {bool isError = false}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isError ? 'Erro' : 'Sucesso'),
          content: Text(mensagem),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (!isError) {
                  Navigator.of(context).pop();
                }
              },
              child: const Text('OK', style: TextStyle(color: corPadrao),),
              style: TextButton.styleFrom(
                foregroundColor: corPadrao,
                ),
            ),
          ],
        );
      },
    );
  }

  void _validarFormulario() async {
    if (_formKey.currentState!.validate()) {
      try {
        final cliente = {
          "CPF": mascaraCPF.text.replaceAll(RegExp(r'[^\d]'), ''),
          "NOME": _nomeController.text,
          "TELEFONE": mascaraTelefone.text.replaceAll(RegExp(r'[^\d]'), ''),
        };

        final clienteResponse = await apiClientes.adicionarCliente(cliente);

        if (clienteResponse.statusCode == 201) {
          final login = {
            "CPF": mascaraCPF.text.replaceAll(RegExp(r'[^\d]'), ''),
            "SENHA": _senhaController.text,
            "STATUS": 1,
            "EMAIL": _emailController.text,
          };

          final loginResponse = await apiLogins.criarLogin(login);

          if (loginResponse.statusCode == 201) {
            _mostrarDialog(
                'Usuário cadastrado com sucesso! Por favor, faça o login.',
                isError: false);
          } else {
            print(jsonDecode(loginResponse.body));
            await apiClientes.deletarCliente("{login['CPF']}");
            _mostrarDialog('Erro ao criar login, tente novamente!',
                isError: true);
          }
        } else {
          print(jsonDecode(clienteResponse.body));
          _mostrarDialog('Cliente já cadastrado!', isError: true);
        }
      } catch (e) {
        _mostrarDialog('Erro durante o cadastro: $e', isError: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      backgroundColor: const Color.fromRGBO(4, 56, 63, 1),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                'Crie sua conta',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              TextFormField(
                controller: _nomeController,
                maxLength: 30,
                decoration: const InputDecoration(
                  counterText: '',
                  labelText: 'Nome Completo',
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white10,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                ),
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite seu nome completo';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white10,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                ),
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite seu e-mail';
                  }
                  if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+$')
                      .hasMatch(value)) {
                    return 'Digite um e-mail válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: mascaraCPF,
                decoration: const InputDecoration(
                  labelText: 'CPF',
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white10,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                ),
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite seu CPF';
                  }
                  String cpf = value.replaceAll(RegExp(r'[^\d]'), '');
                  if (cpf.length != 11) {
                    return 'O CPF deve conter todos os números';
                  }

                  if (validarCPF(cpf) == false) {
                    return 'Digite um CPF válido!';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: mascaraTelefone,
                decoration: const InputDecoration(
                  labelText: 'Número de Telefone',
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white10,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                ),
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite seu número de telefone';
                  } else if(value.length == 11){
                    return 'Digite o número de telefone com 11 caracteres';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _senhaController,
                obscureText: _mostrarSenha,
                maxLength: 100,
                decoration: InputDecoration(
                  counterText: '',
                  labelText: 'Senha',
                  labelStyle: const TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white10,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  suffixIcon: GestureDetector(
                    onTap: _toggleSenha,
                    child: Icon(
                      _mostrarSenha ? Icons.visibility_off : Icons.visibility,
                      color: Colors.white,
                    ),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite sua senha';
                  } else if( value.length <=5){
                    return 'Digite uma senha que tenha no mínimo 6 caracteres.';
                  }               
                  return null;
                },
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _validarFormulario,
                style: ElevatedButton.styleFrom(
                foregroundColor: corPadrao,
                  backgroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Cadastrar',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(4, 56, 63, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
