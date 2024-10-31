import 'package:flutter/material.dart';

class Sobre extends StatefulWidget {
  const Sobre({super.key});

  @override
  State<Sobre> createState() => _SobreNosState();
}

class _SobreNosState extends State<Sobre> {
  static const Color corPadrao = Color.fromRGBO(4, 56, 63, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corPadrao,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 3,
        title: const Text(
          'Sobre Nós',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Divider(
              color: Colors.white,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            SizedBox(height: 16),
            Text(
              'BOAS VINDAS AO DIOGO FARM\'S',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'Alimente seu corpo com o poder da natureza!\nEscolha orgânicos e colha saúde em cada mordida.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Text(
              'Quem somos?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Nós somos a Diogo Farm\'s, uma fazenda urbana recém-criada na zona sul de São Paulo. '
              'Viemos com o propósito de trazer alimentos orgânicos para mais perto da cidade grande.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'O que fazemos?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Trabalhamos com produtos orgânicos, com o plantio e a colheita sendo feitos no nosso próprio ambiente, '
              'com a fiscalização necessária para o produto sair pronto para o consumo.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'O que buscamos?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Buscamos trazer alimentos saudáveis e sem o uso de agrotóxicos para dentro de cada lar. '
              'Queremos proporcionar saúde e qualidade em cada alimento.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
