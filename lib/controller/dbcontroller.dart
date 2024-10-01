import 'package:bookapp/model/hive%20model/bookmodel.dart';
import 'package:bookapp/service/bookservice.dart';
import 'package:flutter/material.dart';

class DbProvider extends ChangeNotifier {
  // List<bookModel> filtered = [];
  int collection = 0;
  List<bookModel> book = [];
  DbService dbservice = DbService();

  Future getAllbooks() async {
    book = await dbservice.getAllTransaction();
    notifyListeners();
  }

  Future addbook(bookModel value) async {
    await dbservice.addTransaction(value);
    getAllbooks();
  }

  Future deletebook(int index) async {
    await dbservice.deleteTransaction(index);
    getAllbooks();
  }

  Future updatebook(bookModel value, index) async {
    await dbservice.updateTransaction(value, index);
    getAllbooks();
  }

  // void filteredSearch(List<bookModel> value) async {
  //   filtered = value;
  //   notifyListeners();
  // }
}
