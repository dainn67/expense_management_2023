import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:learnflutterapp/common/widgets/CommonWidgets.dart';
import 'package:learnflutterapp/ui/home/application_widgets/ApplicationWidgets.dart';

import '../../../data/models/ExpenseRecord.dart';
import '../tiles/RecordTile.dart';

class RecordsTab extends StatefulWidget {
  const RecordsTab({super.key});

  @override
  State<RecordsTab> createState() => _RecordsTabState();
}

class _RecordsTabState extends State<RecordsTab> {
  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    List<ExpenseRecord> records = [
      ExpenseRecord("Train ticket", "BANK", -50000, DateTime.now()),
      ExpenseRecord("Meatball", "WALLET", -20000,
          DateTime.now().add(const Duration(minutes: 3))),
      ExpenseRecord("Coriander", "BANK", -10000,
          DateTime.now().add(const Duration(minutes: 10))),
      ExpenseRecord("Movie ticket", "BANK", -50000,
          DateTime.now().add(const Duration(minutes: 15))),
      ExpenseRecord("New iPhone", "WALLET", -6000000,
          DateTime.now().add(const Duration(days: 1))),
      ExpenseRecord("New iPhone", "WALLET", -6000000,
          DateTime.now().add(const Duration(days: 1))),
      ExpenseRecord("New iPhone", "WALLET", -6000000,
          DateTime.now().add(const Duration(days: 1))),
      ExpenseRecord("New iPhone", "WALLET", -6000000,
          DateTime.now().add(const Duration(days: 2))),
      ExpenseRecord("New iPhone", "WALLET", -6000000,
          DateTime.now().add(const Duration(days: 2))),
      ExpenseRecord("New iPhone", "WALLET", -6000000,
          DateTime.now().add(const Duration(days: 2))),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Month and year tab
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(3, 3))
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    if (kDebugMode) print("Left chevron");
                  },
                  child: Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(10.0),
                      child:
                          const Icon(Icons.chevron_left, color: Colors.black))),
              Text(getDisplayMonthAndYear(currentDate),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
              GestureDetector(
                  onTap: () {
                    if(kDebugMode) print("Right chevron");
                  },
                  child: Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(10.0),
                      child:
                          const Icon(Icons.chevron_right, color: Colors.black)))
            ],
          ),
        ),

        //data
        Expanded(
          child: contentBox(
            5,
            8,
            GroupedListView<ExpenseRecord, DateTime>(
                elements: records,
                //Records in the same day have different hour, minute, second, ... -> set all to 0 to group
                groupBy: (record) => DateTime(
                    record.time.year, record.time.month, record.time.day),
                groupSeparatorBuilder: (DateTime time) => Container(
                      margin:
                          const EdgeInsets.only(left: 50, right: 50, top: 30),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          DateFormat('dd/MM/yyyy').format(time),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                itemBuilder: (context, ExpenseRecord element) =>
                    RecordTile(record: element),
                // itemComparator: (item1, item2) => item1['name'].compareTo(item2['name']), // optional
                order: GroupedListOrder.DESC),
          ),
        ),
      ],
    );
  }
}
