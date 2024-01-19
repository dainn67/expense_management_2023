import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:learnflutterapp/ui/home/HomeController.dart';
import 'package:learnflutterapp/ui/home/application_widgets/ApplicationWidgets.dart';
import 'package:learnflutterapp/ui/home/bloc/MainBlocs.dart';
import 'package:learnflutterapp/ui/home/bloc/MainEvent.dart';
import 'package:learnflutterapp/ui/home/bloc/MainState.dart';
import 'package:learnflutterapp/ui/home/bottom_sheet/CustomBottomSheet.dart';
import 'package:learnflutterapp/ui/home/tabs_and_drawer/MainDrawer.dart';

import 'GeneralSection.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int pageIndex = 0;
  bool isDropdown = true;

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
          return Column(
            children: [
              //General, balance, source tabs and feature buttons
              GeneralSection(
                  balance: state.balance,
                  walletBalance: state.walletBalance,
                  bankBalance: state.bankBalance,
                  stockBalance: state.stockBalance),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                featureButton("New source", const Icon(Icons.source),
                    Colors.lightBlueAccent, () {}),
                featureButton("Upload", const Icon(Icons.cloud_upload),
                    Colors.lightBlueAccent, () {}),
                featureButton("Reset", const Icon(Icons.delete),
                    Colors.lightBlueAccent, () {}),
                featureButton("New record", const Icon(Icons.add), Colors.red,
                    () {
                  HomeController(context: context).handleOpenBottomSheet();
                }),
              ]),
              customDivider(),

              //Contents and Tabs below
              Expanded(
                child: Scaffold(
                    //Navigation bar
                    bottomNavigationBar: Container(
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: GNav(
                          onTabChange: (id) {
                            setState(() {
                              pageIndex = id;
                            });
                          },
                          activeColor: Colors.white,
                          color: Colors.grey,
                          tabBackgroundColor: Colors.lightBlueAccent,
                          padding: const EdgeInsets.all(16),
                          tabs: const [
                            GButton(icon: Icons.home, text: "Home", gap: 8),
                            GButton(
                                icon: Icons.library_books,
                                text: "Current month",
                                gap: 8),
                            GButton(
                                icon: Icons.list, text: "Statistic", gap: 8),
                            GButton(
                                icon: Icons.savings_outlined,
                                text: "Plans",
                                gap: 8)
                          ]),
                    ),

                    //body
                    body: buildPage(pageIndex)),
              )
            ],
          );
        },
      ),
    );
  }

  Widget featureButton(
      String title, Icon icon, Color color, dynamic Function() func) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.width * 0.22,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.width * 0.15,
              child: ElevatedButton(
                onPressed: () {
                  func();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                child: Center(child: icon),
              )),
          Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(title, style: const TextStyle(color: Colors.grey)))
        ],
      ),
    );
  }
}
