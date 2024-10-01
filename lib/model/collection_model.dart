import 'package:bookapp/model/book_model.dart';

class Collection {
  final String name;
  final DateTime createdAt;
  List<Book> books;

  Collection(
      {required this.name, required this.createdAt, this.books = const []});
}
