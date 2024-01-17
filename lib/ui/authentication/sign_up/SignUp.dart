import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnflutterapp/ui/authentication/sign_up/RegisterController.dart';
import 'package:learnflutterapp/ui/authentication/sign_up/bloc/RegisterBloc.dart';
import 'package:learnflutterapp/ui/authentication/sign_up/bloc/RegisterEvent.dart';
import 'package:learnflutterapp/ui/authentication/sign_up/bloc/RegisterState.dart';

import '../../../common/widgets/CommonWidgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // final FocusNode usernameNode = FocusNode();
  // final FocusNode passwordNode = FocusNode();
  // final FocusNode cfPasswordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Scaffold(
            appBar: buildAppBar("Register"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Center(child: reusableText("Sign up for new user")),
                  Container(
                    margin: EdgeInsets.only(top: 30.h),
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: reusableText("Username"),
                        ),
                        buildTextField("Enter your username", "username",
                            "assets/user.png", (value) {
                          context
                              .read<RegisterBloc>()
                              .add(UsernameEvent(value));
                        }),
                        Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: reusableText("Email"),
                        ),
                        buildTextField("Enter your email address", "email",
                            "assets/email.png", (value) {
                          context.read<RegisterBloc>().add(EmailEvent(value));
                        }),
                        Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: reusableText("Password")),
                        buildTextField("Enter your password", "password",
                            "assets/lock.png", (value) {
                          context
                              .read<RegisterBloc>()
                              .add(PasswordEvent(value));
                        }),
                        Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: reusableText("Confirm password")),
                        buildTextField("Confirm your password",
                            "confirm_password", "assets/check.png", (value) {
                          context
                              .read<RegisterBloc>()
                              .add(ConfirmPasswordEvent(value));
                        }),
                        Row(
                          children: [
                            reusableText(
                                "By signing up for a new account, you have agreed with our terms & conditions.")
                          ],
                        ),
                        buildButton("Register", "signup", () {
                          // SignInController(context: context).handleSignIn("email");
                          RegisterController(context: context)
                              .handleEmailRegister();
                        })
                      ],
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
