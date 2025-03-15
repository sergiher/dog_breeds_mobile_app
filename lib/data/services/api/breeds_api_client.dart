import 'dart:convert';
import 'package:http/http.dart' as http;

class BreedsListService {
  Future<List<String>> fetchBreeds() async {
    final response = await http.get(
      Uri.parse('https://dog.ceo/api/breeds/list/all'),
    );
    if (response.statusCode == 200) {
      final jsonApiResponse = jsonDecode(response.body);
      return (jsonApiResponse['message'] as Map<String, dynamic>).keys.toList();
    } else {
      throw Exception('Failed to load the breeds list');
    }
  }
}
