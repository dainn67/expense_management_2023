import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnflutterapp/common/constants/Constants.dart';
import 'package:learnflutterapp/ui/authentication/sign_in/SignInController.dart';
import 'package:learnflutterapp/ui/authentication/sign_in/bloc/SignInBloc.dart';
import 'package:learnflutterapp/ui/authentication/sign_in/bloc/SignInEvent.dart';
import 'package:learnflutterapp/ui/authentication/sign_in/bloc/SignInState.dart';
import 'package:learnflutterapp/ui/authentication/sign_in/SignInWidgets.dart';

import '../../../common/widgets/CommonWidgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Scaffold(
          appBar: buildAppBar("Sign in"),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildThirdPartyLogin(context),
                Center(
                    child: reusableText("or sign in with email and password")),
                Container(
                  margin: EdgeInsets.only(top: 66.h),
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: reusableText("Email"),
                      ),
                      buildTextField(
                          "Enter your email", "email", "assets/user.png",
                          (value) {
                        context.read<SignInBloc>().add(EmailEvent(value));
                      }),
                      Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: reusableText("Password")),
                      buildTextField(
                          "Enter your password", "password", "assets/lock.png",
                          (value) {
                        context.read<SignInBloc>().add(PasswordEvent(value));
                      }),
                      forgetPassword(),
                      buildButton("Sign In", "signin", (){
                        SignInController(context: context).handleSignIn("email");
                      }),
                      buildButton("Register", "register", (){
                        Navigator.of(context).pushNamed(Constants.SIGN_UP_ROUTE);
                      }),
                    ],
                  ),
                )
              ],
            ),
          ));
    });
  }
}
