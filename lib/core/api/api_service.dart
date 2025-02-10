import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
 //final String baseUrl = "http://localhost:4000/api/v1";
  final String baseUrl = "http://10.0.2.2:4000/api/v1";

  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    final response = await http.post(
      url,
      body: jsonEncode(body),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(jsonDecode(response.body)['message'] ?? 'Login failed');
    }
  }
}
