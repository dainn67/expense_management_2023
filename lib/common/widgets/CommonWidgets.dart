import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

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

String getDisplayCurrency(double money){
  final formatter = NumberFormat.currency(
    locale: "vi_VN",
    symbol: '₫',
  );
  return formatter.format(money);
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      maxLines: 2,
      style: TextStyle(
          color: Colors.grey.withOpacity(0.8),
          fontWeight: FontWeight.normal,
          fontSize: 14.sp)),
  );
}

Widget buildTextField(String hint, String type, String imgPath,
    void Function(String value)? func) {
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
            onChanged: (value) => func!(value),
            obscureText: type == "password",
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(color: Colors.grey),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
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
            type != 'signin' ? Colors.white : Colors.lightBlueAccent),
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
                color: type != "signin" ? Colors.grey : Colors.black),
          ),
        ),
      ),
    ),
  );
}
