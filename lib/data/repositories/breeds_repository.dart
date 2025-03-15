import 'package:dog_breeds_mobile_app/data/services/api/breeds_api_client.dart';
import 'package:dog_breeds_mobile_app/data/services/api/model/breed_api_model.dart';

class BreedsRepository {
  final BreedsListService service;
  BreedsRepository(this.service);

  Future<List<String>> getBreeds() => service.fetchBreeds();

  Future<List<dynamic>> getBreedSubBreeds(Breed breed) =>
      service.fetchBreedSubBreeds(breed.breedName);

  Future<List<dynamic>> getBreedImage(Breed breed) =>
      service.fetchBreedImage(breed.breedName);
}
