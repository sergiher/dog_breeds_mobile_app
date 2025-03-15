import 'package:dog_breeds_mobile_app/ui/home/view_models/home_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:dog_breeds_mobile_app/data/repositories/breeds_repository.dart';

import 'home_viewmodel_test.mocks.dart';

@GenerateMocks([BreedsRepository])
void main() {
  group('BreedsListViewModel', () {
    // late BreedsListViewModel viewModel;
    // late MockBreedsRepository mockRepository;

    setUp(() {
      // mockRepository = MockBreedsRepository();
      // viewModel = BreedsListViewModel(breedsRepository: mockRepository);
    });

    // I have to inject a repository in the view form to be able to do this
    //   test (to inject the mockrepository in the view model). I don't do
    //   this at the moment because I would have to change a lot of code files.
  });
}
