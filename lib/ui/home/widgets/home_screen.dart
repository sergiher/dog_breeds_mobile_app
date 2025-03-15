import 'package:dog_breeds_mobile_app/data/services/api/model/breed_api_model.dart';
import 'package:dog_breeds_mobile_app/ui/home/view_models/home_viewmodel.dart';
import 'package:dog_breeds_mobile_app/ui/home/widgets/breed_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BreedsListScreen extends StatelessWidget {
  const BreedsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dog Breeds')),
      body: Consumer<BreedsListViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (viewModel.error != null) {
            return Center(child: Text('Error: ${viewModel.error}'));
          }
          return ListView.builder(
            itemCount: viewModel.breeds.length,
            itemBuilder: (context, index) {
              return BreedCard(
                breed: Breed(breedName: viewModel.breeds[index]),
              );
            },
          );
        },
      ),
    );
  }
}
