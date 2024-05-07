// services/book_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:youngdevtaskelibrary/models/post.dart';

class BookService {
  static Future<List<Book>> searchBooks(String query) async {
    final response = await http.get(Uri.parse('https://www.googleapis.com/books/v1/volumes?q=$query'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body)['items'];
      List<Book> books = body.map((dynamic item) => Book.fromJson(item)).toList();
      return books;
    } else {
      throw "Failed to load books";
    }
  }
}
