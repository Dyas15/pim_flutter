import 'package:flutter/material.dart';

class TelaDeCadastro extends StatelessWidget {
  const TelaDeCadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(4, 56, 63, 1),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        child: ListView(
          children: const [
            Text('')
          ],
        )
      ),
    );
  }
}