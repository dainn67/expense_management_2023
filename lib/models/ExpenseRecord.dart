import 'dart:ui';

import 'package:intl/intl.dart';

class ExpenseRecord {
  final String title;
  final String type;
  final int money;
  final DateTime time;

  ExpenseRecord(this.title, this.type, this.money, this.time);
  
  String getCurrencyString(){
    final formatter = NumberFormat.currency(
      locale: "vi_VN",
      symbol: '₫',
    );
    return formatter.format(money);
  }
}
