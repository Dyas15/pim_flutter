import 'package:flutter/material.dart';

class EsqueciASenha extends StatelessWidget {
  const EsqueciASenha({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color:Color.fromRGBO(4, 56, 63, 1)),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 10,
          left: 40,
          right: 40
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget> [
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset('images/Cadeado4.png'),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            const Text(
              'Esqueceu sua senha?',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.center,
            ),
            const Padding(padding: EdgeInsets.all(10)),
            const Text(
              'Por favor, informe o E-mail associado a sua conta que enviaremos um link com as instruções para a restauração de sua senha.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400
              ),
              textAlign: TextAlign.center,
            ),
            const Padding(padding: EdgeInsets.all(10)),
            
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email),
                prefixIconColor: const Color.fromRGBO(4, 56, 63, 1),
                labelText: 'E-mail',
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(4, 56, 63, 1),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                fixedSize: const Size(200, 60),
              ),
              child: const Text('Enviar', style: TextStyle(fontSize: 19),),
              onPressed: () {
                print("Olá");
              },
            ),
          ],
        ),
      ),
    );
  }
}