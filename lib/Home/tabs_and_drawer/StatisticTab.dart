import 'package:flutter/material.dart';

import '../tiles/StatisticTile.dart';

class StatisticTab extends StatefulWidget {
  const StatisticTab({super.key});

  @override
  State<StatisticTab> createState() => _StatisticTabState();
}

class _StatisticTabState extends State<StatisticTab> {
  String income = "Income";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          StatisticTile(
            title: "Income",
            subtitle: "Salary / Passive income",
            icon: const Icon(Icons.attach_money),
            trailing: "8.000.000 vnđ",
            trailingColor: Colors.green,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          StatisticTile(
            title: "Spending",
            subtitle: "Money spent current month",
            icon: const Icon(Icons.money),
            trailing: "3.000.000 vnđ",
            trailingColor: Colors.red,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          StatisticTile(
            title: "Report & Comparision",
            subtitle: "Comparision with previous months",
            icon: const Icon(Icons.stacked_line_chart),
            trailing: "+ 20%",
            trailingColor: Colors.green,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          StatisticTile(
            title: "Annual Saving",
            subtitle: "Money put to saving this year",
            icon: const Icon(Icons.account_balance),
            trailing: "24.000.000 vnđ",
            trailingColor: Colors.purpleAccent,
          )
        ],
      ),
    );
  }
}

