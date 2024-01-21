import 'dart:ui';

import 'package:intl/intl.dart';

class ExpenseRecord {
  final String title;
  final String type;
  final double money;
  final DateTime time;

  ExpenseRecord(this.title, this.type, this.money, this.time);
}
