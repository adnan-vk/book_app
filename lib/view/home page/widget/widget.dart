// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:bookapp/controller/collection_provider.dart';
import 'package:bookapp/controller/dbcontroller.dart';
import 'package:bookapp/model/book_model.dart';
import 'package:bookapp/model/hive%20model/bookmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomSheetContent extends StatefulWidget {
  const BottomSheetContent({super.key});

  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  String? selectedCategory;
  String? selectedBook;
  TextEditingController detailsController = TextEditingController();
  TextEditingController reviewController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CollectionProvider>(context, listen: false).fetchCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CollectionProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Row(
              children: [
                Text(
                  "Add Book",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              hint: const Text('Select Category'),
              items: provider.categories.map((value) {
                return DropdownMenuItem<String>(
                  value: value.id,
                  child: Text(value.category),
                );
              }).toList(),
              onChanged: (String? newCategoryId) async {
                setState(() {
                  selectedCategory = newCategoryId;
                  selectedBook = null;
                });
                log("message $selectedCategory");
                if (newCategoryId != null) {
                  await provider.fetchBooks(newCategoryId);
                }
              },
              decoration: const InputDecoration(
                labelText: 'Category',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedBook,
              hint: const Text('Select Book'),
              items: provider.books
                  .where((book) => book.categoryId == selectedCategory)
                  .map((Book book) {
                return DropdownMenuItem<String>(
                  value: book.title,
                  child: Text(book.title),
                );
              }).toList(),
              onChanged: (String? newBookId) {
                setState(() {
                  selectedBook = newBookId;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Book',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Details"),
            ),
            const SizedBox(height: 24),
            TextFormField(
              maxLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Type your Review",
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue.shade700),
                ),
                onPressed: () {
                  bookAdd();
                  log('Selected Category: $selectedCategory, Selected Book: $selectedBook');
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bookAdd() {
    final provider = Provider.of<DbProvider>(context, listen: false);
    final bookname = selectedBook;
    final categery = selectedCategory;
    final details = detailsController.text;
    final review = reviewController.text;
    final book = bookModel(
        bookName: bookname.toString(),
        categery: categery.toString(),
        details: details,
        review: review);
    provider.addbook(book);
    log("book added");
  }
}
