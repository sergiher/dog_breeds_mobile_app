import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'package:dog_breeds_mobile_app/ui/home/view_models/home_viewmodel.dart';
import 'package:dog_breeds_mobile_app/ui/home/widgets/breed_card.dart';
import 'package:dog_breeds_mobile_app/ui/home/widgets/home_screen.dart';

import 'home_screen_test.mocks.dart';

@GenerateMocks([BreedsListViewModel])
void main() {
  group('BreedsListScreen', () {
    late MockBreedsListViewModel mockViewModel;

    setUp(() {
      mockViewModel = MockBreedsListViewModel();
    });

    Widget createWidgetUnderTest() {
      return ChangeNotifierProvider<BreedsListViewModel>(
        create: (_) => mockViewModel,
        child: const MaterialApp(home: BreedsListScreen()),
      );
    }

    testWidgets('displays loading indicator when isLoading is true', (
      WidgetTester tester,
    ) async {
      when(mockViewModel.isLoading).thenReturn(true);
      when(mockViewModel.error).thenReturn(null);
      when(mockViewModel.breeds).thenReturn([]);

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('displays error message when error is not null', (
      WidgetTester tester,
    ) async {
      when(mockViewModel.isLoading).thenReturn(false);
      when(mockViewModel.error).thenReturn('Test Error');
      when(mockViewModel.breeds).thenReturn([]);

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('Error: Test Error'), findsOneWidget);
    });

    testWidgets('displays list of breeds when data is loaded', (
      WidgetTester tester,
    ) async {
      when(mockViewModel.isLoading).thenReturn(false);
      when(mockViewModel.error).thenReturn(null);
      when(mockViewModel.breeds).thenReturn(['breed1', 'breed2', 'breed3']);

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pumpAndSettle();

      expect(find.byType(BreedCard), findsNWidgets(3));
    });

    testWidgets('displays appbar title', (WidgetTester tester) async {
      when(mockViewModel.isLoading).thenReturn(false);
      when(mockViewModel.error).thenReturn(null);
      when(mockViewModel.breeds).thenReturn([]);

      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('Dog Breeds'), findsOneWidget);
    });
  });
}
