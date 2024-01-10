import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/DataProvider.dart';
import 'NewExpenseSheet.dart';
import 'NewTransfer.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final dataSource = Provider.of<DataProvider>(context);
    Color color;
    switch (dataSource.newRecordType) {
      case 0:
        color = Colors.red;
        break;
      case 1:
        color = Colors.green;
        break;
      default:
        color = Colors.grey;
        break;
    }

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: CupertinoPageScaffold(

        //navigation bar on top of bottom sheet
        navigationBar: CupertinoNavigationBar(
          middle: const Text("New record"),
          backgroundColor: color,
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              // Add your action here
              print('Action button pressed');
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
                  color: color,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(height: 20),

                        //Expense type: Income, expense, transfer, ...
                        Center(
                          child: CupertinoSlidingSegmentedControl<int>(
                              children: const {
                                0: Text('Expense',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold)),
                                1: Text('Income',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold)),
                                2: Text('Transfer',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold)),
                              },
                              onValueChanged: (index) {
                                dataSource.changeNewType(index!);
                              },
                              groupValue: dataSource.newRecordType),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("vnd",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                  Text("-200.000",
                                      style: TextStyle(
                                          fontSize: 40, color: Colors.white)),
                                ]))
                      ]),
                ),
              ),
              Expanded(
                child: IndexedStack(
                  index: dataSource.newRecordType,
                  children: const [
                    NewExpense(),
                    NewExpense(),
                    NewTransfer(),
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
