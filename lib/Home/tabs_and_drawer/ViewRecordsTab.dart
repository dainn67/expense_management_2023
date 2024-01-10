import 'package:flutter/material.dart';
import 'package:learnflutterapp/provider/RecordsProvider.dart';
import 'package:provider/provider.dart';

import '../tiles/RecordTile.dart';

class ViewRecordsTab extends StatefulWidget {
  const ViewRecordsTab({super.key});

  @override
  State<ViewRecordsTab> createState() => _ViewRecordsTabState();
}

class _ViewRecordsTabState extends State<ViewRecordsTab> {
  @override
  Widget build(BuildContext context) {
    final listData = Provider.of<RecordsProvider>(context);
    final list = listData.list;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Month and year tab
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.036,
            margin: const EdgeInsets.only(
                left: 40.0, right: 40.0, top: 10.0, bottom: 12.0),
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      print("Left chevron");
                    },
                    child: const Icon(Icons.chevron_left, color: Colors.black)),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white),
                  padding: const EdgeInsets.only(
                      left: 40.0, right: 40.0, top: 2.0, bottom: 2.0),
                  child: Text("JAN 2024",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                ),
                GestureDetector(
                    onTap: () {
                      print("Right chevron");
                    },
                    child: const Icon(Icons.chevron_right, color: Colors.black))
              ],
            ),
          ),

          //data
          Expanded(
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, id) {
                  return RecordTile(
                    record: list[id],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
