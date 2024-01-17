import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnflutterapp/ui/home/bloc/MainBlocs.dart';
import 'package:learnflutterapp/ui/home/bloc/MainEvent.dart';
import 'package:learnflutterapp/ui/home/bloc/MainState.dart';
import 'package:learnflutterapp/ui/home/tabs_and_drawer/MainDrawer.dart';
import 'package:learnflutterapp/ui/home/tabs_and_drawer/MainTab.dart';
import 'package:learnflutterapp/ui/home/tabs_and_drawer/StatisticTab.dart';
import 'package:learnflutterapp/ui/home/tabs_and_drawer/ViewRecordsTab.dart';
import 'package:learnflutterapp/ui/home/tabs_and_drawer/plan/PlanTab.dart';

import 'GeneralSection.dart';

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
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return DefaultTabController(
            length: 4,
            child: Column(
              children: [
                GeneralTab(
                    balance: state.balance,
                    walletBalance: state.walletBalance,
                    bankBalance: state.bankBalance,
                    stockBalance: state.stockBalance),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      featureButton("New source", const Icon(Icons.source)),
                      featureButton("Upload date", const Icon(Icons.cloud_upload)),
                      featureButton("Reset", const Icon(Icons.delete)),
                      featureButton("Coming soon", const Icon(Icons.refresh)),
                    ]),
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
                    children: [
                      MainTab(),
                      const ViewRecordsTab(),
                      const StatisticTab(),
                      const PlanTab()
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // context.read<BalanceBLoC>().add(IncrementEvent());
            // showModalBottomSheet(
            //     context: context,
            //     isScrollControlled: true,
            //     shape: const RoundedRectangleBorder(
            //         borderRadius:
            //             BorderRadius.vertical(top: Radius.circular(20.0))),
            //     builder: (context) => const CustomBottomSheet());
            context.read<AppBloc>().add(IncrementBalanceEvent());
          },
          child: const Icon(Icons.add)),
    );
  }

  Widget featureButton(String title, Icon icon) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.width * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.128,
              height: MediaQuery.of(context).size.height * 0.065,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                child: icon,
              )),
          Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(title, style: const TextStyle(color: Colors.grey)))
        ],
      ),
    );
  }
}
