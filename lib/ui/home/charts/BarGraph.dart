import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'BarData.dart';

class CustomBarChart extends StatelessWidget {
  const CustomBarChart({super.key, required this.summary});

  final List summary;

  @override
  Widget build(BuildContext context) {
    BarData barData = BarData(summary[0], summary[1], summary[2]);

    barData.initData();

    return BarChart(BarChartData(
      maxY: 100,
      minY: 0,
      titlesData: FlTitlesData(
          show: true,
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true, getTitlesWidget: getBottomTiles))),
      gridData: const FlGridData(show: false),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          left: BorderSide(
            color: Colors.black, // Left border color
            width: 2.0, // Left border width
          ),
          bottom: BorderSide(
            color: Colors.black, // Bottom border color
            width: 2.0, // Bottom border width
          ),
        ),
      ),
      barGroups: barData.barData
          .map((data) => BarChartGroupData(x: data.x, barRods: [
                BarChartRodData(
                    toY: data.y,
                    color: Colors.lightBlueAccent,
                    width: 50,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(5.0),
                        topLeft: Radius.circular(5.0),
                        bottomLeft: Radius.circular(2.0),
                        bottomRight: Radius.circular(2.0)))
              ]))
          .toList(),
    ));
  }

  Widget getBottomTiles(double value, TitleMeta meta) {
    const style = TextStyle(
        color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold);

    Widget text = const Text("data");
    switch (value.toInt()) {
      case 0:
        text = const Text("Food", style: style);
        break;
      case 1:
        text = const Text("Entertainment", style: style);
        break;
      case 2:
        text = const Text("Other", style: style);
        break;
    }

    return SideTitleWidget(axisSide: meta.axisSide, child: text);
  }
}
