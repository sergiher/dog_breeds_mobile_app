import 'dart:convert';
import 'dart:math';

import 'package:dog_breeds_mobile_app/ui/breed/widgets/breed_screen.dart';
import 'package:dog_breeds_mobile_app/data/services/api/model/breed_api_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BreedInfoScreen extends StatefulWidget {
  const BreedInfoScreen({super.key, required this.breed});
  final Breed breed;

  @override
  // ignore: library_private_types_in_public_api
  _BreedInfoScreenState createState() => _BreedInfoScreenState();
}

class _BreedInfoScreenState extends State<BreedInfoScreen> {
  List<String> breedSubBreeds = [];
  List<String> breedImages = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchBreedTotalInfo();
  }

  Future<void> fetchBreedTotalInfo() async {
    setState(() {
      isLoading = true;
    });

    final responseBreedSubBreeds = await http.get(
      Uri.parse('https://dog.ceo/api/breed/${widget.breed.breedName}/list'),
    );
    if (responseBreedSubBreeds.statusCode == 200) {
      final jsonApiResponse = jsonDecode(responseBreedSubBreeds.body);
      breedSubBreeds = List<String>.from(jsonApiResponse['message']);
    } else {
      // Handle error if needed
    }

    final responseBreedImage = await http.get(
      Uri.parse('https://dog.ceo/api/breed/${widget.breed.breedName}/images'),
    );
    if (responseBreedImage.statusCode == 200) {
      final jsonApiResponse = jsonDecode(responseBreedImage.body);
      breedImages = List<String>.from(jsonApiResponse['message']);
      // jsonApiResponse['message'].forEach((subbreed) {
      //   dogsBreedList.add(Breed(breedName: breed));
      // });
    } else {
      // Handle error if needed
    }

    if (responseBreedSubBreeds.statusCode == 200 &&
        responseBreedImage.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    int randomIndex = Random().nextInt(breedImages.length);
    return BreedInfoCard(
      breedTotalInfo: Breed(
        breedName: widget.breed.breedName,
        subBreeds: breedSubBreeds,
        image: breedImages[randomIndex],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: Text("22")),
  //     body: Center(
  //       child: ElevatedButton(
  //         onPressed: () {
  //           Navigator.pop(context);
  //         },
  //         child: const Text('Go back to the Breeds List'),
  //       ),
  //     ),
  //   );
  // }
}
