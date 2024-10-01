import 'package:bookapp/model/hive%20model/bookmodel.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DbService {
  Future getAllTransaction() async {
    final transactiondb = await Hive.openBox<bookModel>("transaction_db");
    return transactiondb.values.toList();
  }

  Future addTransaction(bookModel value) async {
    final transactiondb = await Hive.openBox<bookModel>("transaction_db");
    return transactiondb.add(value);
  }

  Future deleteTransaction(int index) async {
    final transactiondb = await Hive.openBox<bookModel>("transaction_db");
    await transactiondb.deleteAt(index);
  }

  Future updateTransaction(bookModel value, index) async {
    final transactiondb = await Hive.openBox<bookModel>("transaction_db");
    await transactiondb.putAt(index, value);
  }
}
