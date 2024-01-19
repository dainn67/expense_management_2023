import 'package:flutter/material.dart';
import 'package:learnflutterapp/common/widgets/CommonWidgets.dart';
import 'package:learnflutterapp/models/ExpenseRecord.dart';
import 'package:learnflutterapp/ui/home/application_widgets/ApplicationWidgets.dart';
import '../charts/BarGraph.dart';
import '../tiles/RecordTile.dart';

class MainTab extends StatefulWidget {
  MainTab({super.key});

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  List<double> dataList = [60, 40, 80];
  int recentAmount = 5;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          contentBox(
              20,
              15,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("This month",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold)),
                      Text(getDisplayCurrency(12345678),
                          style: const TextStyle(fontSize: 25)),
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: MainTabBarChart(dataList: dataList)),
                ],
              )),
          contentBox(
              20,
              15,
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text("Recent expenses",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold)),
                RecentList(amount: recentAmount)
              ]))
        ],
      ),
    );
  }
}

class MainTabBarChart extends StatelessWidget {
  const MainTabBarChart({
    super.key,
    required this.dataList,
  });

  final List<double> dataList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: CustomBarChart(summary: dataList),
    );
  }
}

class RecentList extends StatelessWidget {
  final int amount;

  const RecentList({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    List<ExpenseRecord> records = [
      ExpenseRecord("Train ticket", "BANK", -50000, DateTime.now()),
      ExpenseRecord("Meatball", "WALLET", -20000,
          DateTime.now().add(const Duration(minutes: 3))),
      ExpenseRecord("Coriander", "BANK", -10000,
          DateTime.now().add(const Duration(minutes: 10))),
      ExpenseRecord("Movie ticket", "BANK", -50000,
          DateTime.now().add(const Duration(minutes: 15))),
      ExpenseRecord("New iPhone", "WALLET", -6000000,
          DateTime.now().add(const Duration(minutes: 21))),
    ];

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.4,
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
          itemCount: records.length,
          itemBuilder: (context, id) {
            return RecordTile(
              record: records[id],
            );
          }),
    );
  }
}
