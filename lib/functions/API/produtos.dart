import 'package:http/http.dart' as http;

class ApiProdutos {
  //final String baseUrl = 'http://192.168.1.8:8000/api/produtos';
  final String baseUrl = 'http://10.0.2.2:8000/api/produtos';

  Future<http.Response> obterProdutos() async {
    try {
      final response = await http.get(Uri.parse(baseUrl)).timeout(const Duration(seconds: 30));
      return response;
    } catch (e) {
      throw Exception('Erro ao buscar produtos: $e');
    }
  }
}