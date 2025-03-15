import 'package:dog_breeds_mobile_app/ui/home/widgets/breed_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dog_breeds_mobile_app/data/services/api/model/breed_api_model.dart';

void main() {
  group('BreedCard', () {
    testWidgets('displays breed name', (WidgetTester tester) async {
      final breed = Breed(breedName: 'hound');

      await tester.pumpWidget(MaterialApp(home: BreedCard(breed: breed)));

      expect(find.text('hound'), findsOneWidget);
    });

    testWidgets('BreedCard Contains a Card widget', (
      WidgetTester tester,
    ) async {
      final breed = Breed(breedName: 'hound');

      await tester.pumpWidget(MaterialApp(home: BreedCard(breed: breed)));

      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets('BreedCard Contains a ListTile widget', (
      WidgetTester tester,
    ) async {
      final breed = Breed(breedName: 'hound');

      await tester.pumpWidget(MaterialApp(home: BreedCard(breed: breed)));

      expect(find.byType(ListTile), findsOneWidget);
    });
  });
}
