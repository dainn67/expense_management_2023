import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnflutterapp/common/widgets/FlutterToast.dart';
import 'package:learnflutterapp/ui/authentication/sign_up/bloc/RegisterBloc.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String username = state.username;
    String email = state.email;
    String password = state.password;
    String confirmPassword = state.confirmPassword;

    if(username.isEmpty) toastInfo(msg: "Username must not be empty");
    if(email.isEmpty) toastInfo(msg: "Email must not be empty");
    if(password.isEmpty) toastInfo(msg: "Password must not be empty");
    if(confirmPassword.isEmpty) toastInfo(msg: "You must confirm your password");

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      if(credential.user != null){
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(username);

        toastInfo(msg: "Registration form sent. Check your inbox for confirm link");

        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e){
      if(e.code == 'weak-password') toastInfo(msg: "Your password is too weak");
      else if(e.code == 'email-already-in-use') toastInfo(msg: "This email is already in used");
      else if(e.code == 'invalid-email') toastInfo(msg: "Email is invalid");
    }
  }
}