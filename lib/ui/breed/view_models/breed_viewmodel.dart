import 'dart:math';

import 'package:dog_breeds_mobile_app/data/repositories/breeds_repository.dart';
import 'package:dog_breeds_mobile_app/data/services/api/breeds_api_client.dart';
import 'package:dog_breeds_mobile_app/data/services/api/model/breed_api_model.dart';
import 'package:flutter/material.dart';

class BreedInfoViewModel extends ChangeNotifier {
  final BreedsRepository breedsRepository = BreedsRepository(
    BreedsListService(),
  );
  List<dynamic> breedSubBreeds = [];
  List<dynamic> breedImages = [];
  String breedRandomImage = "";
  bool isLoading = true;
  String? error;

  BreedInfoViewModel(this.breed) {
    getBreedTotalInfoFromRepo(breed);
  }
  final Breed breed;

  Future<void> getBreedTotalInfoFromRepo(Breed breed) async {
    try {
      isLoading = true;
      notifyListeners();
      // sub breeds
      breedSubBreeds = await breedsRepository.getBreedSubBreeds(breed);

      // image of the breed
      breedImages = await breedsRepository.getBreedImage(breed);
      int randomIndex = Random().nextInt(breedImages.length);
      breedRandomImage = breedImages[randomIndex];
      error = null;
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
