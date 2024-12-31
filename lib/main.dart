import 'package:flutter/material.dart';
import 'package:demo_project/screens/splash_screen.dart';

void main() {
  runApp(const BookExplorerApp());
}

class BookExplorerApp extends StatelessWidget {
  const BookExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Explorer',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
    );
  }
}
