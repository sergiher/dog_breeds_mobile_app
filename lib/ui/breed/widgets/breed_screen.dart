import 'package:flutter/material.dart';

import '../../../data/services/api/model/breed_api_model.dart';

class BreedInfoCard extends StatelessWidget {
  final Breed breedTotalInfo;

  const BreedInfoCard({super.key, required this.breedTotalInfo, isLoading});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return Scrollbar(
      controller: scrollController,
      child: SingleChildScrollView(
        controller: scrollController,
        padding: null,
        child: Stack(
          children: <Widget>[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        "Breed",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(title: Text(breedTotalInfo.breedName)),
                    ListTile(
                      title: Text(
                        "Sub breeds",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      title:
                          breedTotalInfo.subBreeds.isEmpty
                              ? Text("There are no sub breeds for this breed")
                              : Text(breedTotalInfo.subBreeds.join(', ')),
                    ),
                    ListTile(
                      title: Text(
                        "Image",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Image.network(breedTotalInfo.image),
                  ],
                ),
              ),
            ),
            Center(
              heightFactor: 2,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Go back to the Breeds List'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
