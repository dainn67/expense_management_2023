import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(bottom: 20.h),
    padding: EdgeInsets.only(left: 36.w, right: 36.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableIcon("assets/google.png"),
        _reusableIcon("assets/facebook.png"),
        _reusableIcon("assets/icloud.png")
      ],
    ),
  );
}

Widget _reusableIcon(String imgPath) {
  return GestureDetector(
    child: SizedBox(
      width: 20.w,
      height: 20.w,
      child: Image.asset(imgPath),
    ),
  );
}

Widget forgetPassword() {
  return Container(
    margin: EdgeInsets.only(left: 10.w),
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "Forget you password",
        style: TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.black,
            fontSize: 12.sp,
            decorationColor: Colors.blue),
      ),
    ),
  );
}


