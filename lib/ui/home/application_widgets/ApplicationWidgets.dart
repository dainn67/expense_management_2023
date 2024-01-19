import 'package:flutter/material.dart';

import '../tabs_and_drawer/MainTab.dart';
import '../tabs_and_drawer/StatisticTab.dart';
import '../tabs_and_drawer/RecordsTab.dart';
import '../tabs_and_drawer/plan/PlanTab.dart';

Widget buildPage(int index) {
  List<Widget> widgets = [
    MainTab(),
    RecordsTab(),
    StatisticTab(),
    PlanTab()
  ];

  return widgets[index];
}

Widget contentBox(double paddingWidth, double marginWidth, Widget content){
  return Container(
    margin: EdgeInsets.all(marginWidth),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(3, 3)
          )
        ]),
    padding: EdgeInsets.all(paddingWidth),
    child: content
  );
}

Widget customDivider(){
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 8.0),
    child: Divider(),
  );
}