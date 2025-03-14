import 'package:flutter/material.dart';

import '../../../data/services/api/model/breed_api_model.dart';

class BreedInfoCard extends StatelessWidget {
  final Breed breedTotalInfo;

  const BreedInfoCard({super.key, required this.breedTotalInfo, isLoading});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(title: Text(breedTotalInfo.breedName)),
            ListTile(title: Text(breedTotalInfo.image)),
          ],
        ),
      ),
    );
  }
}
