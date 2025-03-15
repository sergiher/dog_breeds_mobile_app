import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:dog_breeds_mobile_app/data/repositories/breeds_repository.dart';
import 'package:dog_breeds_mobile_app/data/services/api/breeds_api_client.dart';
import 'package:dog_breeds_mobile_app/data/services/api/model/breed_api_model.dart';

import 'breeds_repository_test.mocks.dart';

@GenerateMocks([BreedsListService])
void main() {
  group('BreedsRepository', () {
    late BreedsRepository repository;
    late MockBreedsListService mockService;

    setUp(() {
      mockService = MockBreedsListService();
      repository = BreedsRepository(mockService);
    });

    test('getBreeds calls fetchBreeds from service', () async {
      when(
        mockService.fetchBreeds(),
      ).thenAnswer((_) async => ['breed1', 'breed2']);

      final result = await repository.getBreeds();

      expect(result, ['breed1', 'breed2']);
      verify(mockService.fetchBreeds()).called(1);
    });

    test('getBreedSubBreeds calls fetchBreedSubBreeds from service', () async {
      final breed = Breed(breedName: 'hound');
      when(
        mockService.fetchBreedSubBreeds('hound'),
      ).thenAnswer((_) async => ['sub1', 'sub2']);

      final result = await repository.getBreedSubBreeds(breed);

      expect(result, ['sub1', 'sub2']);
      verify(mockService.fetchBreedSubBreeds('hound')).called(1);
    });

    test('getBreedImage calls fetchBreedImage from service', () async {
      final breed = Breed(breedName: 'hound');
      when(
        mockService.fetchBreedImage('hound'),
      ).thenAnswer((_) async => ['image1.jpg', 'image2.jpg']);

      final result = await repository.getBreedImage(breed);

      expect(result, ['image1.jpg', 'image2.jpg']);
      verify(mockService.fetchBreedImage('hound')).called(1);
    });

    test('getBreeds propagates service exceptions', () async {
      when(mockService.fetchBreeds()).thenThrow(Exception('Service error'));

      expect(() => repository.getBreeds(), throwsA(isA<Exception>()));
      verify(mockService.fetchBreeds()).called(1);
    });

    test('getBreedSubBreeds propagates service exceptions', () async {
      final breed = Breed(breedName: 'hound');
      when(
        mockService.fetchBreedSubBreeds('hound'),
      ).thenThrow(Exception('Service error'));

      expect(
        () => repository.getBreedSubBreeds(breed),
        throwsA(isA<Exception>()),
      );
      verify(mockService.fetchBreedSubBreeds('hound')).called(1);
    });

    test('getBreedImage propagates service exceptions', () async {
      final breed = Breed(breedName: 'hound');
      when(
        mockService.fetchBreedImage('hound'),
      ).thenThrow(Exception('Service error'));

      expect(() => repository.getBreedImage(breed), throwsA(isA<Exception>()));
      verify(mockService.fetchBreedImage('hound')).called(1);
    });
  });
}
