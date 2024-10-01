import 'dart:developer';

import 'package:bookapp/model/book_model.dart';
import 'package:bookapp/model/category_model.dart';
import 'package:bookapp/model/collection_model.dart';
import 'package:bookapp/service/service.dart';
import 'package:flutter/material.dart';

class CollectionProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Collection> collections = [];
  List<Category> categories = [];
  List<Book> books = [];
  bool isLoading = false;

  Future<void> fetchCategories() async {
    try {
      categories = await _apiService.fetchCategories();
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  Future fetchBooks(String categoryId) async {
    try {
      isLoading = true;
      notifyListeners();
      books = await _apiService.fetchBooks(categoryId);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      log("provider error : $e");
    }
  }

  void addCollection(String name) {
    collections.add(Collection(name: name, createdAt: DateTime.now()));
    notifyListeners();
  }

  void addBookToCollection(Collection collection, Book book) {
    collection.books.add(book);
    notifyListeners();
  }

  void updateBookInCollection(Collection collection, Book updatedBook) {
    int index =
        collection.books.indexWhere((book) => book.id == updatedBook.id);
    if (index != -1) {
      collection.books[index] = updatedBook;
      notifyListeners();
    }
  }
}
