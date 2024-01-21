import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:learnflutterapp/common/widgets/FlutterToast.dart';
import 'package:learnflutterapp/data/models/Category.dart';
import 'package:learnflutterapp/data/repository/DataRepo.dart';
import 'package:learnflutterapp/ui/authentication/sign_in/bloc/SignInBloc.dart';
import 'package:learnflutterapp/ui/authentication/sign_in/bloc/SignInEvent.dart';

import '../../ui/home/tiles/SubCategoryTile.dart';

AppBar buildAppBar(String title) {
  return AppBar(
    iconTheme: const IconThemeData(color: Colors.black),
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: Colors.grey.withOpacity(0.5),
        height: 1.0,
      ),
    ),
    title: Center(
      child: Text(title,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black)),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
  );
}

String getDisplayCurrency(double money) {
  final formatter = NumberFormat.currency(
    locale: "vi_VN",
    symbol: '₫',
  );
  return formatter.format(money);
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Expanded(
      child: Text(text,
          style: TextStyle(
              color: Colors.grey.withOpacity(0.8),
              fontWeight: FontWeight.normal,
              fontSize: 14.sp)),
    ),
  );
}

String getDisplayMonthAndYear(DateTime date) {
  final formatter = DateFormat('MMM, yyyy');
  return formatter.format(date);
}

bool isEmailValid(String email) {
  // Define a regular expression pattern for a simple email validation
  RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

  // Use the hasMatch method to check if the email matches the pattern
  return emailRegex.hasMatch(email);
}

Widget buildTextField(BuildContext context, String hint, String type,
    String imgPath, String? error) {
  return Container(
    margin: EdgeInsets.only(bottom: 20.h),
    width: 325.w,
    height: 55.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.w),
        border: Border.all(color: Colors.black)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 16.w,
          height: 16.w,
          margin: EdgeInsets.only(left: 15.w, right: 10.w),
          child: Image.asset(imgPath),
        ),
        Container(
          width: 270.w,
          padding: EdgeInsets.only(right: 10.w),
          child: TextField(
            onChanged: (value) {
              var notifier = context.read<SignInBloc>();
              switch (type) {
                case 'emailSignIn': {
                    String? message;
                    if(value.isEmpty) message = 'Email must not be empty';
                    else if (!isEmailValid(value)) message = 'Invalid email format';

                    notifier.add(SignInEmailEvent(value, message));
                    break;
                  }
                // case 'password': {
                //     if (!isEmailValid(value)) {
                //       context
                //           .read<SignInBloc>()
                //           .add(EmailErrorEvent('Invalid email format'));
                //     }
                //     break;
                //   }
              }
            },
            obscureText: type == "password",
            decoration: InputDecoration(
                errorText: error,
                hintText: hint,
                hintStyle: const TextStyle(color: Colors.grey),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent))),
          ),
        )
      ],
    ),
  );
}

Widget buildButton(String name, String type, void Function()? func) {
  return Container(
    margin: EdgeInsets.only(bottom: 10.h),
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            type == 'signin' || type == 'signup'
                ? Colors.lightBlueAccent
                : Colors.white),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
        ),
      ),
      onPressed: func,
      child: SizedBox(
        height: 50.h,
        child: Center(
          child: Text(
            name,
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: type == 'signin' || type == 'signup'
                    ? Colors.white
                    : Colors.grey),
          ),
        ),
      ),
    ),
  );
}

void openCustomDialog(BuildContext context, String title, String type) {
  showGeneralDialog(
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Container();
      },
      transitionBuilder: (context, a1, a2, widget) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.5, end: 1).animate(a1),
          child: FadeTransition(
            opacity: Tween<double>(begin: 0.5, end: 1).animate(a1),
            child: AlertDialog(
              title: Text(title),
              content: Container(
                  color: Colors.grey,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: IntrinsicHeight(
                    child: GroupedListView<SubCategory, int>(
                      elements: DataRepo.subCategories,
                      groupBy: (element) => element.type,
                      groupSeparatorBuilder: (int type) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.all(5),
                          child: Text(DataRepo.categories
                              .firstWhere((element) => element.id == type)
                              .title),
                        );
                      },
                      itemBuilder: (context, SubCategory subCategory) =>
                          SubCategoryTile(subCategory: subCategory),
                    ),
                  )),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none),
            ),
          ),
        );
      });
}
