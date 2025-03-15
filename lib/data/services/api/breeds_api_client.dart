import 'dart:convert';
import 'dart:developer' as developer;
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
      developer.log('Failed to fetch the list of breeds');
      throw Exception('Failed to load the breeds list');
    }
  }

  Future<List<dynamic>> fetchBreedSubBreeds(String breedName) async {
    final response = await http.get(
      Uri.parse('https://dog.ceo/api/breed/$breedName/list'),
    );
    if (response.statusCode == 200) {
      final jsonApiResponse = jsonDecode(response.body);
      return (jsonApiResponse['message']);
    } else {
      developer.log(
        'Failed to load the list of sub breeds for the breed $breedName',
      );
      throw Exception(
        'Failed to load the list of sub breeds for the breed $breedName',
      );
    }
  }

  Future<List<dynamic>> fetchBreedImage(String breedName) async {
    final response = await http.get(
      Uri.parse('https://dog.ceo/api/breed/$breedName/images'),
    );
    if (response.statusCode == 200) {
      final jsonApiResponse = jsonDecode(response.body);
      return (jsonApiResponse['message']);
    } else {
      developer.log('Failed to load the images for the breed $breedName');
      throw Exception('Failed to load the images for the breed $breedName');
    }
  }
}
