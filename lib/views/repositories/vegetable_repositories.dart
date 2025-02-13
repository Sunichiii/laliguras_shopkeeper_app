import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/vegetable_model.dart';

class VegetableRepository {
  final String apiUrl = "https://bishalpantha.com.np/api/v1/product";

  Future<List<Vegetable>> fetchVegetables() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        if (responseData['success']) {
          List<dynamic> products = responseData['data']['products'];
          return products.map((product) => Vegetable.fromJson(product)).toList();
        } else {
          throw Exception("API call was not successful.");
        }
      } else {
        throw Exception("Failed to fetch data. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching dat"
          "a: $e");
    }
  }
}
