import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnflutterapp/common/constants/Constants.dart';
import 'package:learnflutterapp/common/widgets/FlutterToast.dart';
import 'package:learnflutterapp/ui/authentication/sign_in/bloc/SignInBloc.dart';

class SignInController {
  final BuildContext context;

  SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        //similar to BlocProvider.of<SignInBloc>(context).state
        final state = context.read<SignInBloc>().state;
        final String email = state.email;
        final String password = state.password;

        if (email.isEmpty) {
          toastInfo(msg: "Email field must not be empty");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "Password field must not be empty");
          return;
        }

        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        if (credential.user == null) {
          toastInfo(msg: "User information doesn't exist");
          return;
        }
        if (!credential.user!.emailVerified) {
          toastInfo(msg: "You don't have access to this application");
          return;
        }

        var user = credential.user;
        if (user != null) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              Constants.HOME_SCREEN_ROUTE, (route) => false);
          if (kDebugMode) print(user.toString());
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        toastInfo(msg: "User information doesn't exist");
      } else if (e.code == 'user-wrong-password') {
        toastInfo(msg: "Invalid password");
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: "Invalid email");
      }
    } catch (e) {
      if (kDebugMode) print(e);
    }
  }
}
