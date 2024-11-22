import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiRedefinicao {
  final String baseUrl = 'http://10.0.2.2:8000/api/redefinicao/enviar';

  Future<http.Response> enviarRedefinicao(Map<String, dynamic> dados) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(dados),
      );
      return response;
    } catch (e) {
      throw Exception('Erro ao enviar redefinição: $e');
    }
  }
}
