import 'package:flutter/material.dart';

class EsqueciASenha extends StatelessWidget {
  const EsqueciASenha({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(4, 56, 63, 1),
        iconTheme: const IconThemeData(color:Colors.white),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 10,
          left: 40,
          right: 40
        ),
        color: Color.fromRGBO(4, 56, 63, 1),
        child: ListView(
          children: <Widget> [
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
              'Por favor, informe o E-mail associado a sua conta que enviaremos um link com as instruções para a restauração de sua senha.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const Padding(padding: EdgeInsets.all(10)),
            
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email),
                prefixIconColor:  Colors.white,
                labelText: 'E-mail',
                labelStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
              ),
              style: const TextStyle(color: Colors.white),
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