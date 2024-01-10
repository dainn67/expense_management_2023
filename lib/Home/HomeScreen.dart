import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnflutterapp/Home/bottom_sheet/NewExpenseSheet.dart';
import 'package:learnflutterapp/Home/tabs_and_drawer/GeneralTab.dart';
import 'package:learnflutterapp/Home/tabs_and_drawer/MainDrawer.dart';
import 'package:learnflutterapp/Home/tabs_and_drawer/MainTab.dart';
import 'package:learnflutterapp/Home/tabs_and_drawer/plan/PlanTab.dart';
import 'package:learnflutterapp/Home/tabs_and_drawer/StatisticTab.dart';
import 'package:learnflutterapp/Home/tabs_and_drawer/ViewRecordsTab.dart';
import 'package:learnflutterapp/provider/DataProvider.dart';
import 'package:provider/provider.dart';

import 'bottom_sheet/NewTransfer.dart';
import 'bottom_sheet/CustomBottomSheet.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget._scaffoldKey,
      drawer: const MainDrawer(),
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            widget._scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: const Text('Home'),
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            GeneralTab(),
            const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home_outlined, color: Colors.grey)),
                Tab(icon: Icon(Icons.library_books, color: Colors.grey)),
                Tab(icon: Icon(Icons.list, color: Colors.grey)),
                Tab(icon: Icon(Icons.savings_outlined, color: Colors.grey))
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [MainTab(), ViewRecordsTab(), StatisticTab(), PlanTab()],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20.0))),
                builder: (context) => const CustomBottomSheet());
          },
          child: const Icon(Icons.add)),
    );
  }
}