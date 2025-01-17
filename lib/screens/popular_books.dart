import 'package:flutter/material.dart';
import '../widgets/navigation_drawer.dart';
import '../services/book_category_api.dart';
import '../models/book.dart';

class PopularBooksListScreen extends StatefulWidget {
  @override
  _PopularBooksListScreenState createState() => _PopularBooksListScreenState();
}

class _PopularBooksListScreenState extends State<PopularBooksListScreen> {
  late List<Book> books;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      var data = await BookApi.fetchBooks();
      setState(() {
        books = data;
        isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Popular Books')),
      drawer: BookDrawer(),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: books.length,
              itemBuilder: (BuildContext context, int index) {
                final book = books[index];
                return Card(
                  child: ListTile(
                    leading: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Image.network(
                          book.coverImage,
                          fit: BoxFit.fill,
                          width: 50,
                          height: 50,
                        )),
                    title: Text(book.title),
                    subtitle: Text(book.description),
                  ),
                );
              }),
    );
  }
}
