import 'package:flutter/material.dart';
import 'package:teste/functions/trocarPagina.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _mostrarOlinho = true;
  static const Color corPadrao = Color.fromRGBO(4, 56, 63, 1);
  static const Color corBranca = Colors.white;

  void _olinho() {
    setState(() {
      _mostrarOlinho = !_mostrarOlinho;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corPadrao,
      body: Center(  // Centralizando o conteúdo verticalmente
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/logo_pequena.png', fit: BoxFit.fill),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  prefixIconColor: corBranca,
                  labelText: 'Usuário',
                  labelStyle: const TextStyle(color: corBranca),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      color: corBranca,
                      width: 2.0,
                    ),
                  ),
                ),
                style: const TextStyle(color: corBranca),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              TextField(
                obscureText: _mostrarOlinho,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock, color: corBranca),
                  labelText: 'Senha',
                  labelStyle: const TextStyle(color: corBranca),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      color: corBranca,
                      width: 2.0,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _mostrarOlinho ? Icons.visibility : Icons.visibility_off,
                      color: corBranca,
                    ),
                    onPressed: _olinho,
                  ),
                ),
                style: const TextStyle(color: corBranca),
              ),
              const Padding(padding: EdgeInsets.all(4)),
              GestureDetector(
                onTap: () {
                  trocarPagina(context, 'esqueci');
                },
                child: const Text(
                  'Esqueceu a senha?',
                  style: TextStyle(color: corBranca),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: corBranca,
                  foregroundColor: corPadrao,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  fixedSize: const Size(200, 60),
                ),
                child: const Text(
                  'Entrar',
                  style: TextStyle(fontSize: 19),
                ),
                onPressed: () {
                  trocarPagina(context, 'inicio');
                },
              ),
              const Padding(padding: EdgeInsets.all(4)),
            ],
          ),
        ),
      ),
    );
  }
}