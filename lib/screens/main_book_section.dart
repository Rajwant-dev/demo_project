import 'package:flutter/material.dart';
import '../widgets/navigation_drawer.dart';

class StaticBookListScreen extends StatelessWidget {
  final List<Map<String, String>> category = [
    {'title': 'Technology', 'image': 'assets/images/technology.png'},
    {'title': 'Science', 'image': 'assets/images/science.png'},
    {'title': 'Economy', 'image': 'assets/images/economy.png'},
    {'title': 'Psychology', 'image': 'assets/images/psychology.png'},
  ];

  StaticBookListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Categories')),
      drawer: BookDrawer(),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: category.map((item) {
            return Column(
              children: [
                Image.asset(
                  item['image']!,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8),
                Text(
                  item['title']!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 24),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
