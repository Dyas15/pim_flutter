import 'package:flutter/material.dart';
import 'package:teste/controllers/tema_controller.dart';

class Resumo extends StatelessWidget {
  const Resumo(
      {super.key,
      required this.cidade,
      required this.descricao,
      required this.temperaturaAtual,
      required this.temperaturaMaxima,
      required this.temperaturaMinima,
      required this.numeroIcone});

  final String cidade;
  final String descricao;
  final double temperaturaAtual;
  final double temperaturaMaxima;
  final double temperaturaMinima;
  final int numeroIcone;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.all(5)),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                Icon(Icons.brightness_6_outlined),
                Switch(
                  value: TemaController.instancia.usarTemaEscuro,
                  onChanged: (valor) {
                    TemaController.instancia.trocarTema();
                  },
                )
              ],
            )
          ],
        ),
        Text(
          cidade,
          style: TextStyle(fontSize: 18),
        ),
        Padding(padding: EdgeInsets.all(5)),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('images/$numeroIcone.png')),
              Padding(padding: EdgeInsets.all(2)),
              Text(
                '${temperaturaAtual.toStringAsFixed(0)} Cº',
                style: TextStyle(fontSize: 40),
              ),
              VerticalDivider(
                color: Colors.black,
                thickness: 1,
              ),
              Column(
                children: [
                  Text('${temperaturaMaxima.toStringAsFixed(0)} Cº'),
                  Text('${temperaturaMinima.toStringAsFixed(0)} Cº'),
                ],
              )
            ],
          ),
        ),
        Padding(padding: EdgeInsets.all(10)),
        Text(descricao, style: TextStyle(fontSize: 16),)
      ],
    );
  }
}
