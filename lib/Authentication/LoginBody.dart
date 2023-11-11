import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginBody extends StatefulWidget {
  final Function() updateCallback;

  const LoginBody({super.key, required this.updateCallback});

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();

  String? _emailError;
  String? _passwordError;

  void _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;


    showDialog(context: context, builder: (context){
      return const Center(
        child: CircularProgressIndicator(),
      );
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e){
      setState(() {
        if(e.code == 'user-not-found') {
          _emailError = "Incorrect email";
        }else if(e.code == 'wrong-password'){
          _passwordError = "Incorrect password";
        }else{
          _passwordError = "Incorrect email or password";
        }
      });
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0))),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: const Center(
                      child: Text("SIGN IN",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue)))),
            ),
            TextField(
              focusNode: emailNode,
              controller: _emailController,
              style: const TextStyle(height: 1.5),
              onChanged: (value){
                setState(() {
                  if(value.isEmpty) {
                    _emailError = "This field can not be empty";
                  } else {
                    _emailError = null;
                  }
                });
              },
              onSubmitted: (_) {
                emailNode.unfocus();
                FocusScope.of(context).requestFocus(passwordNode);
              },
              decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: _emailError,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  prefixIcon: const Icon(Icons.person_outline)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            TextField(
              focusNode: passwordNode,
              controller: _passwordController,
              style: const TextStyle(height: 1.5),
              onChanged: (value){
                setState(() {
                  if(value.isEmpty) {
                    _passwordError = "This field can not be empty";
                  } else {
                    _passwordError = null;
                  }
                });
              },
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: _passwordError,
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                prefixIcon: const Icon(Icons.lock_outline),
              ),
              obscureText: true,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ElevatedButton(
              style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
              onPressed: _login,
              child: const Padding(padding: EdgeInsets.all(10.0), child: Text('Sign In', style: TextStyle(fontSize: 18),)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? "),
                GestureDetector(
                  onTap: (){ widget.updateCallback(); },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}