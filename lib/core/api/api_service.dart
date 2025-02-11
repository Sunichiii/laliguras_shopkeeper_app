import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://10.0.2.2:4000/api/v1";

  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    print(" Sending POST request to: $url");
    print(" Request Body: ${jsonEncode(body)}");

    try {
      final response = await http.post(
        url,
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        print(" API Response: ${response.body}");
        return jsonDecode(response.body);
      } else {
        print(" API Error: ${response.body}");
        throw Exception(jsonDecode(response.body)['message'] ?? 'Login failed');
      }
    } catch (e) {
      print(" Network error: $e");
      throw Exception("Network error or timeout. Please try again.");
    }
  }
}
