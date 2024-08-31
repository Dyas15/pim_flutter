import 'package:flutter/material.dart';
import 'package:teste/models/previsao_hora.dart';
import 'package:teste/services/previsao_services.dart';
import 'package:teste/widgets/proximas_temperaturas.dart';
import 'package:teste/widgets/resumo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<PrevisaoHora> ultimasPrevisoes = [];

  @override
  void initState() {
    super.initState();
    _carregarPrevisoes();
  }

  Future<void> _carregarPrevisoes() async {
    PrevisaoServices service = PrevisaoServices();
    List<PrevisaoHora> previsoes = await service.recuperarUltimasPrevisoes();
    setState(() {
      ultimasPrevisoes = previsoes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vidente"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            Resumo(
              cidade: "Taboão da serra - SP",
              temperaturaAtual: 15,
              temperaturaMaxima: 15,
              temperaturaMinima: 15,
              descricao: "Ensolarado",
              numeroIcone: 20,
            ),
            Padding(padding: EdgeInsets.all(10)),
            ProximasTemperaturas(previsoes: ultimasPrevisoes),
          ],
        ),
      ),
    );
  }
}
