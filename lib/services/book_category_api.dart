import 'dart:convert';
import 'package:dio/dio.dart';

class BookApi {
  static Future<List<Map<String, Object>>> fetchBooks() async {
    try {
      var response =
          await Dio().get('https://www.freetestapi.com/api/v1/books');

      // Explicitly parse the response data
      if (response.data is List) {
        return (response.data as List)
            .map((item) => Map<String, Object>.from(item as Map))
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
