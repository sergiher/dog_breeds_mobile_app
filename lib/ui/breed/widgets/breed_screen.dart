import 'package:dog_breeds_mobile_app/ui/breed/view_models/breed_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/services/api/model/breed_api_model.dart';

class BreedInfoScreen extends StatelessWidget {
  final Breed breed;
  const BreedInfoScreen({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(title: const Text('Breed Info')),
      body: ChangeNotifierProvider(
        create: (context) => BreedInfoViewModel(breed),
        child: Consumer<BreedInfoViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (viewModel.error != null) {
              return Center(child: Text('Error: ${viewModel.error}'));
            }
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
                            ListTile(title: Text(breed.breedName)),
                            ListTile(
                              title: Text(
                                "Sub breeds",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            ListTile(
                              title:
                                  viewModel.breedSubBreeds.isEmpty
                                      ? Text(
                                        "There are no sub breeds for this breed",
                                      )
                                      : Text(
                                        viewModel.breedSubBreeds.join(', '),
                                      ),
                            ),
                            ListTile(
                              title: Text(
                                "Image",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Image.network(viewModel.breedRandomImage),
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
          },
        ),
      ),
    );
  }
}
