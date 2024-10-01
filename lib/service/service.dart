import 'dart:convert';
import 'dart:developer';
import 'package:bookapp/model/book_model.dart';
import 'package:bookapp/model/category_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      'https://books-api-task-db307f0c475d.herokuapp.com/api';

  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future fetchBooks(String categoryId) async {
    final response = await http.get(Uri.parse('$baseUrl/books/$categoryId'));
    try {
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => Book.fromJson(json)).toList();
      } else {}
    } catch (e) {
      log("service error : $e");
    }
  }
}
