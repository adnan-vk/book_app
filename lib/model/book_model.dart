class Book {
  final int id;
  final String title;
  final String summary;
  final String categoryId;

  Book(
      {required this.id,
      required this.title,
      required this.summary,
      required this.categoryId});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        id: json['id'],
        title: json['title'],
        summary: json['summary'],
        categoryId: json['categoryId']);
  }
}
