import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste/Provider/salvar.dart';
import 'package:teste/functions/API/clientes.dart';
import 'package:teste/functions/API/logins.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmarSenhaController = TextEditingController();

  Future<Map<String, dynamic>?> _obterUsuario(String cpf) async {
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

  Future<Map<String, dynamic>?> _obterLogin(String cpf) async {
    try {
      final response = await ApiLogins().obterLogin(cpf);
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

  Future<void> _atualizarCliente(String cpf) async {
    try {
      final clienteData = {
        'NOME': nomeController.text,
      };
      final response = await ApiClientes().atualizarCliente(cpf, clienteData);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cliente atualizado com sucesso!')),
        );
        // Atualiza a tela para refletir as mudanças
        setState(() {
          // Atualiza os controladores com as novas informações
          nomeController.text = nomeController.text;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erro ao atualizar cliente.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao atualizar cliente.')),
      );
    }
  }

  Future<void> _atualizarLogin(String cpf) async {
    try {
      final loginData = {
        'EMAIL': emailController.text,
        'SENHA': senhaController.text,
      };
      final response = await ApiLogins().atualizarLogin(cpf, loginData);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login atualizado com sucesso!')),
        );
        // Atualiza a tela para refletir as mudanças
        setState(() {
          emailController.text = emailController.text;
          senhaController.text = senhaController.text;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erro ao atualizar login.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao atualizar login.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    String? cpf = loginProvider.cpf; // Recuperando o CPF do provider

    return Scaffold(
      backgroundColor: const Color.fromRGBO(4, 56, 63, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(4, 56, 63, 1),
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Map<String, dynamic>?>>(
        future: Future.wait([
          _obterUsuario(cpf!),
          _obterLogin(cpf)
        ]), // Esperando ambos os dados
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator()); // Exibe carregamento
          }

          if (snapshot.hasError) {
            return const Center(
                child: Text('Erro ao carregar dados.')); // Em caso de erro
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
                child: Text(
                    'Nenhum dado encontrado.')); // Se nenhum dado for encontrado
          }

          // Extraindo os dados das duas respostas
          final clienteDados = snapshot.data![0]; // Dados da API de Clientes
          final loginDados = snapshot.data![1]; // Dados da API de Logins

          // Verificando se os dados existem
          nomeController.text = clienteDados?['NOME'] ?? 'Nome não disponível';
          emailController.text =
              loginDados?['EMAIL'] ?? 'E-mail não disponível';

          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage('images/paisagem.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 130),
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 55,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('images/logo_pequena.png'),
                            radius: 50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    nomeController.text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text(
                            "Nome completo",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          subtitle: TextField(
                            controller: nomeController, // Campo editável
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                          ),
                        ),
                        const Divider(color: Colors.black),
                        ListTile(
                          title: const Text(
                            "E-mail",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          subtitle: TextField(
                            controller: emailController, // Campo editável
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                          ),
                        ),
                        const Divider(color: Colors.black),
                        ListTile(
                          title: const Text(
                            "Senha",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          subtitle: TextField(
                            controller: senhaController, // Campo editável
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                            obscureText: true, // Esconde a senha
                          ),
                        ),
                        const Divider(color: Colors.black),
                        ListTile(
                          title: const Text(
                            "Confirmar Senha",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          subtitle: TextField(
                            controller: confirmarSenhaController,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                            obscureText: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (confirmarSenhaController.text != "" &&
                        senhaController.text != "") {
                      if (senhaController.text ==
                          confirmarSenhaController.text) {
                        _atualizarCliente(cpf);
                        _atualizarLogin(cpf);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('As senhas não coincidem.')),
                        );
                      }
                    } else {
                      _atualizarCliente(cpf);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color.fromRGBO(4, 56, 63, 1),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text("Salvar Alterações"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
