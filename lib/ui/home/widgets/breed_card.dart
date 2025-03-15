import 'package:dog_breeds_mobile_app/ui/breed/widgets/breed_screen.dart';
import 'package:flutter/material.dart';

import '../../../data/services/api/model/breed_api_model.dart';

class BreedCard extends StatelessWidget {
  final Breed breed;

  const BreedCard({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BreedInfoScreen(breed: breed),
              ),
            ),
          },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [ListTile(title: Text(breed.breedName))]),
        ),
      ),
    );
  }
}
