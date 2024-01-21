import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnflutterapp/ui/welcome/bloc/WelcomEvent.dart';
import 'package:learnflutterapp/ui/welcome/bloc/WelcomeBloc.dart';

import '../../../Global.dart';
import '../../../common/constants/Constants.dart';
import '../bloc/WelcomeState.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Stack(
              alignment: Alignment.center,
              children: [
                PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    },
                    children: [
                      welcomeTab(
                          1,
                          context,
                          "Next",
                          "Welcome to Expense Manager",
                          "Manage and record all your expenses",
                          "assets/expenses.png"),
                      welcomeTab(
                        2,
                        context,
                        "Next",
                        "Various features",
                        "Multiple handy features to keep track",
                        "assets/jigsaw.png",
                      ),
                      welcomeTab(
                        3,
                        context,
                        "Start using",
                        "Plans and Payment",
                        "Saving plans for future payment",
                        "assets/plan.png",
                      ),
                    ]),
                Positioned(
                    bottom: 30.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      decorator: DotsDecorator(
                          color: Colors.grey,
                          activeColor: Colors.blue,
                          size: const Size.square(8.0),
                          activeSize: const Size(18.0, 8.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ))
              ],
            );
          },
        ),
      ),
    );
  }

  Widget welcomeTab(int index, BuildContext context, String buttonName,
      String title, String subtitle, String imgPath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 100.w,
            height: 100.w,
            margin: const EdgeInsets.all(50.0),
            child: Image.asset(imgPath)),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: Text(title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: Text(subtitle,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal)),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate);
            } else {
              Navigator.of(context).pushNamedAndRemoveUntil(Constants.SIGN_IN_ROUTE, (route) => false);
              Global.storageService.setBool(Constants.DEVICE_ALREADY_OPEN_BEFORE, true);
            }
          },
          child: Container(
              margin: EdgeInsets.only(top: 200.h, left: 25.w, right: 25.w),
              width: 325.w,
              height: 50.h,
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(15.w),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(5, 5))
                  ]),
              child: Center(
                  child: Text(buttonName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.normal)))),
        ),
      ],
    );
  }
}
