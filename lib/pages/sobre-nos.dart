import 'package:flutter/material.dart';

class SobreNos extends StatefulWidget {
  const SobreNos({super.key});

  @override
  State<SobreNos> createState() => _SobreNosState();
}

class _SobreNosState extends State<SobreNos> {
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Divider(
              color: Colors.white,
              thickness: 1,
            ),
            const SizedBox(height: 16),
            const Text(
              'BOAS VINDAS AO DIOGO FARM\'S',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'Alimente seu corpo com o poder da natureza!\nEscolha orgânicos e colha saúde em cada mordida.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            _titulo('Quem somos?'),
            _conteudo(
              'Nós somos a Diogo Farm\'s, uma fazenda urbana recém-criada na zona sul de São Paulo. Viemos com o propósito de trazer alimentos orgânicos para mais perto da cidade grande.',
            ),
            const SizedBox(height: 24),
            _titulo('O que fazemos?'),
            _conteudo(
              'Trabalhamos com produtos orgânicos, com o plantio e a colheita sendo feitos no nosso próprio ambiente, com a fiscalização necessária para o produto sair pronto para o consumo.',
            ),
            const SizedBox(height: 24),
            _titulo('O que buscamos?'),
            _conteudo(
              'Buscamos trazer alimentos saudáveis e sem o uso de agrotóxicos para dentro de cada lar. Queremos proporcionar saúde e qualidade em cada alimento.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _titulo(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _conteudo(String content) {
    return Text(
      content,
      textAlign: TextAlign.justify,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
    );
  }
}
