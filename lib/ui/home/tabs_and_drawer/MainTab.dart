import 'package:flutter/material.dart';
import '../charts/BarGraph.dart';

class MainTab extends StatefulWidget {
  MainTab({super.key});

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  List<double> dataList = [60, 40, 80];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            const Text("This month", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            const Text("1.234.567 vnd", style: TextStyle(fontSize: 25)),
            const SizedBox(height: 30),
            MainTabBarChart(dataList: dataList),
            const SizedBox(height: 30),
            const Text("Recent expenses", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const RecentList()
          ],
        ),
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
  const RecentList({super.key});

  @override
  Widget build(BuildContext context) {
    // final listData = Provider.of<RecordsProvider>(context);
    // final list = listData.list;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.4,
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, id) {
            // return RecordTile(
            //   record: list[id],
            // );
            return Text("DRAFT");
          }),
    );
  }
}


