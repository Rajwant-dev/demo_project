import 'package:flutter/material.dart';
import '../widgets/navigation_drawer.dart';
import '../services/book_category_api.dart';

class PopularBooksListScreen extends StatefulWidget {
  @override
  _PopularBooksListScreenState createState() => _PopularBooksListScreenState();
}

class _PopularBooksListScreenState extends State<PopularBooksListScreen> {
  late List<Map<String, Object>> jsonList;
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
        jsonList = data;
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
              itemCount: jsonList.length,
              itemBuilder: (BuildContext context, int index) {
                final thumbnail =
                    jsonList[index]['cover_image'] as String? ?? '';
                final title =
                    jsonList[index]['title'] as String? ?? 'Unknown Title';
                final subtitle = jsonList[index]['description'] as String? ??
                    'No Description';

                return Card(
                  child: ListTile(
                    leading: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Image.network(
                          thumbnail,
                          fit: BoxFit.fill,
                          width: 50,
                          height: 50,
                        )),
                    title: Text(title),
                    subtitle: Text(subtitle),
                  ),
                );
              }),
    );
  }
}
