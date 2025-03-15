import 'package:dog_breeds_mobile_app/ui/home/view_models/home_viewmodel.dart';
import 'package:dog_breeds_mobile_app/ui/home/widgets/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BreedsListViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dogs Breeds Information',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 230, 61, 0),
        ),
        useMaterial3: true,
      ),
      home: BreedsListScreen(),
    );
  }
}
