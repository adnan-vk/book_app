import 'package:bookapp/controller/collection_provider.dart';
import 'package:bookapp/model/collection_model.dart';
import 'package:bookapp/view/add_categery/add_categery.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CollectionProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Colors.blue.shade700),
            child: const Align(
                alignment: Alignment(-.9, .2),
                child: Text(
                  "Good Morning",
                  style: TextStyle(color: Colors.white),
                )),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: provider.collections.length,
              itemBuilder: (context, index) {
                final collection = provider.collections[index];
                return ListTile(
                  title: Text(collection.name),
                  subtitle: Text(
                    '${collection.books.length} books | Created on: ${collection.createdAt}',
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CollectionDetailPage(collection: collection),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue.shade700,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddCategery(),
              ));
        },
        label: const Text(
          "Create a new collection",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class CollectionDetailPage extends StatelessWidget {
  final Collection collection;

  const CollectionDetailPage({super.key, required this.collection});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(collection.name)),
      body: ListView.builder(
        itemCount: collection.books.length,
        itemBuilder: (context, index) {
          final book = collection.books[index];
          return ListTile(
            title: Text(book.title),
            subtitle: Text(book.summary),
            onTap: () {},
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
