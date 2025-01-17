import 'dart:convert';
import 'package:dio/dio.dart';
import '../models/book.dart';

class BookApi {
  static Future<List<Book>> fetchBooks() async {
    try {
      var response =
          await Dio().get('https://www.freetestapi.com/api/v1/books');

      // parse the response data into a list of objects
      if (response.data is List) {
        return (response.data as List)
            .map((item) => Book.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception("Unexpected data format");
      }
    } catch (e) {
      print("Error fetching books: $e");
      throw Exception("Failed to load books!");
    }
  }
}
