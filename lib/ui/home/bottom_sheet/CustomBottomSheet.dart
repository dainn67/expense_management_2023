import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'NewExpenseSheet.dart';
import 'NewTransfer.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // Color color;
    // // switch (dataSource.newRecordType) {
    // switch (1 - 1) {
    //   case 0:
    //     color = Colors.red;
    //     break;
    //   case 1:
    //     color = Colors.grey;
    //     break;
    //   default:
    //     color = Colors.green;
    //     break;
    // }

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: CupertinoPageScaffold(
        //navigation bar on top of bottom sheet
        navigationBar: CupertinoNavigationBar(
          middle: const Text("New record"),
          backgroundColor: Colors.grey,
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              // Add your action here
              if (kDebugMode) {
                print('Action button pressed');
              }
            },
            child: const Text("Add", style: TextStyle(color: Colors.black)),
          ),
        ),

        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              IntrinsicHeight(
                child: Container(
                  // color: color,
                  color: Colors.grey,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(height: 20),

                        //Expense type: Income, expense, transfer, ...
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
                              // dataSource.changeNewType(index!);
                            },
                            // groupValue: dataSource.newRecordType
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),

                        // Section for entering amount, currency unit
                        const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("vnd",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                  // Text("-200.000",
                                  //     style: TextStyle(
                                  //         fontSize: 40, color: Colors.white)),
                                  SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(),
                                    ),
                                  )
                                ]))
                      ]),
                ),
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
}
