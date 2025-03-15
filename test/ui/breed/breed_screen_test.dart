import 'package:dog_breeds_mobile_app/ui/breed/widgets/breed_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'package:dog_breeds_mobile_app/data/services/api/model/breed_api_model.dart';
import 'package:dog_breeds_mobile_app/ui/breed/view_models/breed_viewmodel.dart';

import 'breed_screen_test.mocks.dart';

@GenerateMocks([BreedInfoViewModel])
void main() {
  group('BreedInfoScreen', () {
    late MockBreedInfoViewModel mockViewModel;
    late Breed testBreed;

    setUp(() {
      mockViewModel = MockBreedInfoViewModel();
      testBreed = Breed(breedName: 'affenpinscher');
    });

    Widget createWidgetUnderTest() {
      return ChangeNotifierProvider<BreedInfoViewModel>(
        create: (_) => mockViewModel,
        child: MaterialApp(home: BreedInfoScreen(breed: testBreed)),
      );
    }

    testWidgets('displays loading indicator when isLoading is true', (
      WidgetTester tester,
    ) async {
      when(mockViewModel.isLoading).thenReturn(true);
      when(mockViewModel.error).thenReturn(null);
      when(mockViewModel.breedSubBreeds).thenReturn([]);
      when(mockViewModel.breedRandomImage).thenReturn('');

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    // testWidgets('displays breed information when data is loaded', (
    //   WidgetTester tester,
    // ) async {
    //   when(mockViewModel.isLoading).thenReturn(false);
    //   when(mockViewModel.error).thenReturn(null);
    //   when(mockViewModel.breedSubBreeds).thenReturn(['sub1', 'sub2']);
    //   when(mockViewModel.breedRandomImage).thenReturn('test_image_url');

    //   await tester.pumpWidget(createWidgetUnderTest());
    //   await tester.pumpAndSettle();

    //   expect(find.text('hound'), findsNWidgets(2));
    //   expect(find.text('sub1, sub2'), findsOneWidget);
    //   expect(find.byType(Image), findsOneWidget);
    //   expect(find.byType(ElevatedButton), findsOneWidget);
    // });

    // testWidgets(
    //   'displays no sub breeds message when sub breeds list is empty',
    //   (WidgetTester tester) async {
    //     when(mockViewModel.isLoading).thenReturn(false);
    //     when(mockViewModel.error).thenReturn(null);
    //     when(mockViewModel.breedSubBreeds).thenReturn([]);
    //     when(mockViewModel.breedRandomImage).thenReturn('test_image_url');

    //     await tester.pumpWidget(createWidgetUnderTest());
    //     await tester.pumpAndSettle();

    //     expect(
    //       find.text('There are no sub breeds for this breed'),
    //       findsOneWidget,
    //     );
    //   },
    // );

    testWidgets('displays appbar title', (WidgetTester tester) async {
      when(mockViewModel.isLoading).thenReturn(false);
      when(mockViewModel.error).thenReturn(null);
      when(mockViewModel.breedSubBreeds).thenReturn([]);
      when(mockViewModel.breedRandomImage).thenReturn('');

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('Breed Info'), findsOneWidget);
    });
  });
}
