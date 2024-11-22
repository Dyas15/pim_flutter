import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClientes {
  final String baseUrl = 'http://192.168.1.8:8000/api/clientes';

  // Obter cliente por CPF
  Future<http.Response> obterClientePorCPF(String cpf) async {
    try {
      final url = '$baseUrl$cpf';
      final response = await http.get(Uri.parse(url));
      return response;
    } catch (e) {
      throw Exception('Erro ao buscar cliente por CPF: $e');
    }
  }

  // Adicionar um novo cliente
  Future<http.Response> adicionarCliente(Map<String, dynamic> cliente) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(cliente),
      );
      return response;
    } catch (e) {
      throw Exception('Erro ao adicionar cliente: $e');
    }
  }

  // Atualizar cliente por CPF
  Future<http.Response> atualizarCliente(String cpf, Map<String, dynamic> cliente) async {
    try {
      final url = '$baseUrl$cpf';
      final response = await http.put(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(cliente),
      );
      return response;
    } catch (e) {
      throw Exception('Erro ao atualizar cliente: $e');
    }
  }

  // Deletar cliente por CPF
  Future<http.Response> deletarCliente(String cpf) async {
    try {
      final url = '$baseUrl$cpf';
      final response = await http.delete(Uri.parse(url));
      return response;
    } catch (e) {
      throw Exception('Erro ao deletar cliente: $e');
    }
  }
}
