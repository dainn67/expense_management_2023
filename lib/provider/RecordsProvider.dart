import 'package:flutter/material.dart';

import '../models/ExpenseRecord.dart';

class RecordsProvider with ChangeNotifier {
  final List<ExpenseRecord> _list = [
    ExpenseRecord("Train ticket", "wallet", "100.000vnd"),
    ExpenseRecord("Movie ticket", "bank", "50.000vnd"),
    ExpenseRecord("Internet", "bank", "265.000vnd"),
    ExpenseRecord("Taxi", "bank", "265.000vnd"),
    ExpenseRecord("Laptop", "bank", "265.000vnd"),
    ExpenseRecord("Fuel", "bank", "265.000vnd"),
    ExpenseRecord("Food", "bank", "265.000vnd"),
    ExpenseRecord("Vegetables", "wallet", "200.000vnd"),
    ExpenseRecord("Food", "bank", "84.000vnd"),
    ExpenseRecord("Food", "bank", "100.000vnd"),
    ExpenseRecord("Internet", "bank", "265.000vnd"),
  ];

  List<ExpenseRecord> get list{
    return [..._list];
  }

}