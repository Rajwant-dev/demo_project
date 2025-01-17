import 'package:flutter/material.dart';
import 'package:demo_project/screens/static_books_categories.dart';
import 'package:demo_project/screens/popular_books.dart';

class BookDrawer extends StatelessWidget {
  const BookDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Book Explorer',
                style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            title: const Text('Book Categories List'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => StaticBooksCategories()),
              );
            },
          ),
          ListTile(
            title: const Text('Popular Books'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => PopularBooksListScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
