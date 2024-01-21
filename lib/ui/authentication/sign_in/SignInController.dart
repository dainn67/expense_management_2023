import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:learnflutterapp/common/constants/Constants.dart';
import 'package:learnflutterapp/common/widgets/FlutterToast.dart';
import 'package:learnflutterapp/ui/authentication/sign_in/bloc/SignInBloc.dart';
import 'package:learnflutterapp/ui/authentication/sign_in/bloc/SignInEvent.dart';

import '../../../Global.dart';

class SignInController {
  final BuildContext context;

  SignInController({required this.context});

  // Future<http.Response>
  void handleSignInOceantech() async {
    final state = context.read<SignInBloc>().state;
    final String username = state.email;
    final String password = state.password;

    var fields = {
      Constants.USERNAME: username,
      Constants.PASSWORD: password,
      Constants.CLIENT_ID: 'core_client',
      Constants.CLIENT_SECRET: 'secret',
      Constants.GRANT_TYPE: 'password'
    };

    final http.Response response = await http
        .post(Uri.parse('${Constants.BASE_URL}oauth/token'), body: fields);
    if (response.statusCode == 200) {
      final Map<String, dynamic> dataMap = json.decode(response.body);
      if (dataMap.isNotEmpty) {
        Global.storageService.saveLoginInfo(
            dataMap[Constants.ACCESS_TOKEN],
            dataMap[Constants.REFRESH_TOKEN],
            dataMap[Constants.USER]);
      }
    }
  }

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        //similar to BlocProvider.of<SignInBloc>(context).state
        final state = context.read<SignInBloc>().state;

        final String email = state.email;
        final String password = state.password;

        if (email.isEmpty) {
          context.read<SignInBloc>().add(SignInEmailEvent(email, 'Email must not be empty'));
          toastInfo(msg: "Email must not be empty");
          return;
        }
        if (password.isEmpty) {
          context.read<SignInBloc>().add(PasswordErrorEvent('Password must not be empty'));
          toastInfo(msg: "Password field must not be empty");
          return;
        }

        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        if (credential.user == null) {
          context.read<SignInBloc>().add(SignInEmailEvent(email, 'User information not exist'));
          toastInfo(msg: "User information doesn't exist");
          return;
        }
        if (!credential.user!.emailVerified) {
          context.read<SignInBloc>().add(SignInEmailEvent(email, "You don't have access to this application"));
          toastInfo(msg: "");
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
