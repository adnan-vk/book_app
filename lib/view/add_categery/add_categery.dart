import 'dart:developer';

import 'package:bookapp/controller/dbcontroller.dart';
import 'package:bookapp/view/home%20page/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCategery extends StatefulWidget {
  const AddCategery({super.key});

  @override
  State<AddCategery> createState() => _AddCategeryState();
}

class _AddCategeryState extends State<AddCategery> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DbProvider>(context, listen: false);
    final coll = provider.collection + 1;
    provider.getAllbooks();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Collection $coll",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              setState(() {});
            },
          ),
        ],
      ),
      body: provider.book.isEmpty
          ? Center(
              child: GestureDetector(
                onTap: () => showBottomSheet(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      size: 25,
                      color: Colors.blue.shade700,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Add your first book',
                      style: TextStyle(
                        color: Colors.blue.shade700,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: provider.book.length,
                      itemBuilder: (context, index) {
                        final item = provider.book[index];
                        log("add cat log ${item.details}");
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: BookCard(
                            category: item.categery,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        showBottomSheet(context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Add book",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String category;
  BookCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  category,
                  style: const TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {
                    // Show dialog when more_vert is clicked
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                onPressed: () {
                                  // Handle Remove functionality here
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  "Remove",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(height: 16),
                              TextButton(
                                onPressed: () {
                                  // Handle Edit functionality here
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  "Edit",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              "Book of everything",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            const Text(
              "An emotional journey of a musician finding his voice in post-war Europe",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.book, color: Colors.blue),
              label: const Text(
                "Read Review",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return const BottomSheetContent();
    },
  );
}
