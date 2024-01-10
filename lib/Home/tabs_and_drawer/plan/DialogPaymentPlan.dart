import 'package:flutter/material.dart';

class DialogPaymentPlan extends StatelessWidget {
  const DialogPaymentPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("New payment plan"),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: const IntrinsicHeight(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(hintText: "New payment name"),
              ),
              TextField(
                decoration: InputDecoration(hintText: "Amount of money"),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Add'),
        )
      ],
    );
  }
}
