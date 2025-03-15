import 'package:dog_breeds_mobile_app/main.dart';
import 'package:dog_breeds_mobile_app/ui/home/view_models/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App loads and displays dog breeds', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => BreedsListViewModel(),
        child: const MyApp(),
      ),
    );

    // Wait for data to load
    await tester.pumpAndSettle();

    // Verify that at least one dog breed appears
    expect(find.byType(ListTile), findsWidgets);
  });
}
