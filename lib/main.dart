import 'package:bookapp/controller/collection_provider.dart';
import 'package:bookapp/controller/dbcontroller.dart';
import 'package:bookapp/model/hive%20model/bookmodel.dart';
import 'package:bookapp/view/home%20page/home.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(bookModelAdapter().typeId)) {
    Hive.registerAdapter(bookModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CollectionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DbProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Book Logger',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
