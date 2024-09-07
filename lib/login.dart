import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(4, 56, 63, 1),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/logo_pequena.png', fit: BoxFit.fill),
            const TextField(
              decoration: InputDecoration(
                  labelText: 'Usuário',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  )),
              style: TextStyle(color: Colors.white),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            const TextField(
              decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  )),
              style: TextStyle(color: Colors.white),
              obscureText: true,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromRGBO(4, 56, 63, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  fixedSize: const Size(100, 60)
                  ),
              child: const Text('Entrar'),
              onPressed: () {
                print("oi");
              },
            ),
          ],
        ),
      ),
    );
  }
}
