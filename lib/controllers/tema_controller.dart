import 'package:flutter/material.dart';

class TemaController extends ChangeNotifier {
  bool usarTemaEscuro = false;
  static TemaController instancia = TemaController();

  trocarTema() {
    usarTemaEscuro = !usarTemaEscuro;
    notifyListeners();
  }
}