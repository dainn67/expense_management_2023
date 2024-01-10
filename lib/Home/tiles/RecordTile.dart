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
          leading: record.type == "WALLET"
              ? const Icon(Icons.account_balance_outlined)
              : const Icon(Icons.money_outlined),
          title: Text(record.title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          subtitle: Text(toDisplayTime(record.time),
              style: const TextStyle(fontSize: 16)),
          trailing: Text(record.getCurrencyString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: record.money > 0 ? Colors.green : Colors.red)),
        ));
  }

  String toDisplayTime(DateTime time) {
    return "${time.day}/${time.month}/${time.year} ${time.hour}:${time.minute}";
  }
}