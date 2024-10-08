import 'package:flutter/material.dart';
import 'package:teste/functions/trocarPagina.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _mostrarOlinho = true;

  void _olinho() {
    setState(() {
      _mostrarOlinho = !_mostrarOlinho;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/logo_pequena.png', fit: BoxFit.fill),
             TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                prefixIconColor: const Color.fromRGBO(4, 56, 63, 1),
                labelText: 'Usuário',
                labelStyle: const TextStyle(color: Color.fromRGBO(4, 56, 63, 1)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(4, 56, 63, 1),
                    width: 2.0,
                  ),
                ),
              ),
              style: const TextStyle(color: Color.fromRGBO(4, 56, 63, 1)),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            TextField(
              obscureText: _mostrarOlinho,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock, color: Color.fromRGBO(4, 56, 63, 1)),
                labelText: 'Senha',
                labelStyle: const TextStyle(color: Color.fromRGBO(4, 56, 63, 1)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(4, 56, 63, 1),
                    width: 2.0,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _mostrarOlinho ? Icons.visibility : Icons.visibility_off,
                    color: const Color.fromRGBO(4, 56, 63, 1),
                  ),
                  onPressed: _olinho,
                ),
              ),
              style: const TextStyle(color: Color.fromRGBO(4, 56, 63, 1)),
            ),
            const Padding(padding: EdgeInsets.all(4)),
            GestureDetector(
              onTap: () {
                trocarPagina(context, 'esqueci');
              },
              child: const Text('Esqueceu a senha?',style: TextStyle(color: Color.fromRGBO(4, 56, 63, 1)),),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(4, 56, 63, 1),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                fixedSize: const Size(200, 60),
              ),
              child: const Text('Entrar', style: TextStyle(fontSize: 19),),
              onPressed: () {
                print("Olá");
              },
            ),
            const Padding(padding: EdgeInsets.all(4)),
          ],
        ),
      ),
    );
  }
}