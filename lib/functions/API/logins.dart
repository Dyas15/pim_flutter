import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiLogins {
  final String baseUrl = 'http://10.0.2.2:8000/api/logins/cliente';

  // Função para GET
  Future<http.Response> obterLogin(String cpf) async {
    try {
      final url = '$baseUrl/$cpf';
      final response = await http.get(Uri.parse(url));
      return response;
    } catch (e) {
      throw Exception('Erro ao realizar GET: $e');
    }
  }

  // Função para POST
  Future<http.Response> criarLogin(Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      return response;
    } catch (e) {
      throw Exception('Erro ao realizar POST: $e');
    }
  }

  // Função para PUT
  Future<http.Response> atualizarCliente(int id, Map<String, dynamic> data) async {
    try {
      final url = '$baseUrl/$id';
      final response = await http.put(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      return response;
    } catch (e) {
      throw Exception('Erro ao realizar PUT: $e');
    }
  }

  // Função para DELETE
  Future<http.Response> deletarCliente(int id) async {
    try {
      final url = '$baseUrl/$id';
      final response = await http.delete(Uri.parse(url));
      return response;
    } catch (e) {
      throw Exception('Erro ao realizar DELETE: $e');
    }
  }
}
