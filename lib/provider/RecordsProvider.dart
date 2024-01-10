import 'package:flutter/material.dart';

import '../models/ExpenseRecord.dart';

class RecordsProvider with ChangeNotifier {
  final List<ExpenseRecord> _list = [
    ExpenseRecord("Train ticket", "WALLET", 100000, DateTime.now()),
    ExpenseRecord("Movie ticket", "BANK", -50000, DateTime.now()),
    ExpenseRecord("Internet", "WALLET", 265000, DateTime.now()),
    ExpenseRecord("Taxi", "BANK", 265000, DateTime.now()),
    ExpenseRecord("Laptop", "BANK", -265000, DateTime.now()),
    ExpenseRecord("Fuel", "BANK", 265000, DateTime.now()),
    ExpenseRecord("Food", "BANK", -265000, DateTime.now()),
    ExpenseRecord("Vegetables", "WALLET", -200000, DateTime.now()),
    ExpenseRecord("Food", "BANK", 84000, DateTime.now()),
    ExpenseRecord("Food", "WALLET", 100000, DateTime.now()),
    ExpenseRecord("Internet", "WALLET", 265000, DateTime.now()),
  ];

  List<ExpenseRecord> get list{
    return [..._list];
  }

}