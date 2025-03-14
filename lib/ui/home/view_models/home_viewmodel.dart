import 'dart:convert';
import 'package:dog_breeds_mobile_app/ui/home/widgets/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../data/services/api/model/breed_api_model.dart';

class BreedsListScreen extends StatefulWidget {
  const BreedsListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BreedsListScreenState createState() => _BreedsListScreenState();
}

class _BreedsListScreenState extends State<BreedsListScreen> {
  List<Breed> dogsBreedList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchBreeds();
  }

  Future<void> fetchBreeds() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(
      Uri.parse('https://dog.ceo/api/breeds/list/all'),
    );
    if (response.statusCode == 200) {
      final jsonApiResponse = jsonDecode(response.body);
      jsonApiResponse['message'].forEach((breed, subbreed) {
        dogsBreedList.add(Breed(breedName: breed));
      });
      setState(() {
        isLoading = false;
      });
    } else {
      // Handle error if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Breeds List')),
      body: ListView.builder(
        itemCount: dogsBreedList.length,
        itemBuilder: (context, index) {
          return BreedCard(breed: dogsBreedList[index]);
        },
      ),
    );
  }
}
