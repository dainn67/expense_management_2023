import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'tabs/NewExpenseSheet.dart';
import 'tabs/NewTransfer.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  int recordType = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: CupertinoPageScaffold(
        //navigation bar on top of bottom sheet
        navigationBar: CupertinoNavigationBar(
          middle: const Text("New record"),
          backgroundColor: Colors.grey.shade200,
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: const Text("Add",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.green)),
          ),
        ),

        //body
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              Container(
                color: Colors.grey.shade200,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(height: 20),

                      //Expense type selector: Income, expense, transfer, ...
                      Center(
                        child: CupertinoSlidingSegmentedControl<int>(
                            backgroundColor: Colors.white54,
                            children: const {
                              0: Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.0, right: 10.0),
                                  child: Text('Expense',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red))),
                              1: Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.0, right: 10.0),
                                  child: Text('Transfer',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black))),
                              2: Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.0, right: 10.0),
                                  child: Text('Income',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green))),
                            },
                            onValueChanged: (index) {
                              setState(() {
                                recordType = index!;
                              });
                            },
                            groupValue: recordType),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),

                      // Section for entering amount, currency unit
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("vnd",
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.grey)),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  height: 100,
                                  // color: Colors.red,
                                  child: TextField(
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                        color: _getCorrespondingColor()),
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration.collapsed(
                                        hintText: ''),
                                    inputFormatters: [
                                      CurrencyTextInputFormatter(
                                          locale: 'vi', symbol: 'đ')
                                    ],
                                  ),
                                )
                              ]))
                    ]),
              ),
              const Expanded(
                child: IndexedStack(
                  // index: dataSource.newRecordType,
                  children: [
                    NewExpense(),
                    NewTransfer(),
                    NewExpense(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Color _getCorrespondingColor() {
    switch (recordType) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.black;
      case 2:
        return Colors.green;
      default:
        return Colors.black;
    }
  }
}
