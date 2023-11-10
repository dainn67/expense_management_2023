import 'package:flutter/material.dart';
import 'package:learnflutterapp/models/ExpenseRecord.dart';

class RecordTile extends StatelessWidget {
  const RecordTile({super.key, required this.record});

  final ExpenseRecord record;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      margin: const EdgeInsets.all(5.0),
      child: ListTile(
        leading: const Icon(Icons.account_balance_outlined),
        title: Text(record.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        subtitle: Text(record.subTitle, style: const TextStyle(fontSize: 16)),
        trailing: Text(record.trailingText),
      )
    );
  }
}
