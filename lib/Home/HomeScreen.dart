import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnflutterapp/Home/NewExpenseSheet.dart';
import 'package:learnflutterapp/Home/tabs_and_drawer/MainDrawer.dart';
import 'package:learnflutterapp/Home/tabs_and_drawer/MainTab.dart';
import 'package:learnflutterapp/Home/tabs_and_drawer/PlanTab.dart';
import 'package:learnflutterapp/Home/tabs_and_drawer/StatisticTab.dart';
import 'package:learnflutterapp/provider/DataProvider.dart';
import 'package:provider/provider.dart';

import 'NewTransfer.dart';

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
        length: 3,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.24,
              color: Theme.of(context).primaryColor,
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("TOTAL CAPITOL",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      Text("12.000.000 vnđ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.06)),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                            child: Row(
                              children: [
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: const Text("Wallet",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15))),
                                const Text("1.000.000 vnđ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                            child: Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: const Text("Bank",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15)),
                                ),
                                const Text("5.000.000 vnđ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                            child: Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: const Text("Stock",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15)),
                                ),
                                const Text("6.000.000 vnđ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const Padding(
                      padding: EdgeInsets.only(
                          top: 10.0, bottom: 20.0, left: 10.0, right: 10.0),
                      child: VerticalDivider()),
                  const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FeatureButton(
                                title: "New source", icon: Icon(Icons.add)),
                            FeatureButton(
                                title: "Load data",
                                icon: Icon(Icons.cloud_download_outlined)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FeatureButton(
                                title: "Delete all",
                                icon: Icon(Icons.delete_outline)),
                            FeatureButton(
                                title: "Coming soon",
                                icon: Icon(Icons.ac_unit)),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home_outlined, color: Colors.grey)),
                Tab(icon: Icon(Icons.library_books, color: Colors.grey)),
                Tab(icon: Icon(Icons.savings_outlined, color: Colors.grey)),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [MainTab(), StatisticTab(), PlanTab()],
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

class FeatureButton extends StatelessWidget {
  const FeatureButton({super.key, required this.title, required this.icon});

  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.185,
      height: MediaQuery.of(context).size.height * 0.12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
              child: Text(title, style: const TextStyle(color: Colors.white)))
        ],
      ),
    );
  }
}

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final dataSource = Provider.of<DataProvider>(context);
    Color color;
    switch (dataSource.newRecordType) {
      case 0:
        color = Colors.red;
        break;
      case 1:
        color = Colors.green;
        break;
      default:
        color = Colors.grey;
        break;
    }

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: const Text("New record"),
          backgroundColor: color,
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              // Add your action here
              print('Action button pressed');
            },
            child: const Text("Add", style: TextStyle(color: Colors.black)),
          ),
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              IntrinsicHeight(
                child: Container(
                  color: color,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(height: 20),
                        Center(
                          child: CupertinoSlidingSegmentedControl<int>(
                              children: const {
                                0: Text('Expense',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                1: Text('Income',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                2: Text('Transfer',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              },
                              onValueChanged: (index) {
                                dataSource.changeNewType(index!);
                              },
                              groupValue: dataSource.newRecordType),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("vnd",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                  Text("-200.000",
                                      style: TextStyle(
                                          fontSize: 40, color: Colors.white)),
                                ]))
                      ]),
                ),
              ),
              Expanded(
                child: IndexedStack(
                  index: dataSource.newRecordType,
                  children: const [
                    NewExpense(),
                    NewExpense(),
                    NewTransfer(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
