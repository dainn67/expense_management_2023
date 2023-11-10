import 'package:flutter/material.dart';
import 'package:learnflutterapp/provider/RecordsProvider.dart';
import 'package:provider/provider.dart';

import '../RecordTile.dart';
import 'MainTab.dart';

class StatisticTab extends StatefulWidget {
  const StatisticTab({super.key});

  @override
  State<StatisticTab> createState() => _StatisticTabState();
}

class _StatisticTabState extends State<StatisticTab> {
  @override
  Widget build(BuildContext context) {
    final listData = Provider.of<RecordsProvider>(context);
    final list = listData.list;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("9/11/2023", style: TextStyle(fontSize: 16)),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.36,
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, id) {
                    return RecordTile(
                      record: list[id],
                    );
                    // ExpenseRecord(num: "hey");
                  }),
            ),
            const Text("8/11/2023", style: TextStyle(fontSize: 16)),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.36,
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, id) {
                    return RecordTile(
                      record: list[id + 1],
                    );
                    // ExpenseRecord(num: "hey");
                  }),
            ),
            const Text("7/11/2023", style: TextStyle(fontSize: 16)),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.36,
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, id) {
                    return RecordTile(
                      record: list[id + 2],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
