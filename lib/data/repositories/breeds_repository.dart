import 'package:dog_breeds_mobile_app/data/services/api/breeds_api_client.dart';

class BreedsRepository {
  final BreedsListService service;
  BreedsRepository(this.service);

  Future<List<String>> getBreeds() => service.fetchBreeds();
}
