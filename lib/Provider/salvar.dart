import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  String? _cpf;

  String? get cpf => _cpf;

  Future<void> carregarLogin() async {
    final prefs = await SharedPreferences.getInstance();
    _cpf = prefs.getString('CPF');
    notifyListeners();
  }

  Future<void> salvarLogin(String cpf) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('CPF', cpf);
    _cpf = cpf;
    notifyListeners();
  }

  Future<void> limparLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('CPF');
    _cpf = null;
    notifyListeners();
  }
}
