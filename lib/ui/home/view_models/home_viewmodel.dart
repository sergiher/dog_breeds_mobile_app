import 'package:dog_breeds_mobile_app/data/repositories/breeds_repository.dart';
import 'package:dog_breeds_mobile_app/data/services/api/breeds_api_client.dart';
import 'package:flutter/material.dart';

class BreedsListViewModel extends ChangeNotifier {
  final BreedsRepository breedsRepository = BreedsRepository(
    BreedsListService(),
  );
  List<String> breeds = [];
  bool isLoading = true;
  String? error;

  BreedsListViewModel() {
    getBreedsFromRepo();
  }

  Future<void> getBreedsFromRepo() async {
    try {
      isLoading = true;
      notifyListeners();
      breeds = await breedsRepository.getBreeds();
      error = null;
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
