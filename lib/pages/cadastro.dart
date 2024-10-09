import 'package:flutter/material.dart';

class TelaDeCadastro extends StatefulWidget {
  const TelaDeCadastro({super.key});

  @override
  State<TelaDeCadastro> createState() => _TelaDeCadastroState();
}

class _TelaDeCadastroState extends State<TelaDeCadastro> {
  bool _mostrarSenha = true;
  bool _mostrarConfirmarSenha = true;

  void _toggleSenha() {
    setState(() {
      _mostrarSenha = !_mostrarSenha;
    });
  }

  void _toggleConfirmarSenha() {
    setState(() {
      _mostrarConfirmarSenha = !_mostrarConfirmarSenha;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(4, 56, 63, 1),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
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
            const SizedBox(height: 65),
            const TextField(
              decoration: InputDecoration(
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
                contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              ),
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
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
                contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              ),
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: _mostrarSenha,
              decoration: InputDecoration(
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
                contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                suffixIcon: IconButton(
                  icon: Icon(
                    _mostrarSenha ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ),
                  onPressed: _toggleSenha,
                ),
              ),
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: _mostrarConfirmarSenha,
              decoration: InputDecoration(
                labelText: 'Confirmar Senha',
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
                contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                suffixIcon: IconButton(
                  icon: Icon(
                    _mostrarConfirmarSenha ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ),
                  onPressed: _toggleConfirmarSenha,
                ),
              ),
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Lógica de cadastro
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
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
            const SizedBox(height: 20),
          ],
        ),
      ),
      backgroundColor: const Color.fromRGBO(4, 56, 63, 1),
    );
  }
}