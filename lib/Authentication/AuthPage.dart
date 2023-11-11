import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Home/HomeScreen.dart';
import 'LoginBody.dart';
import 'SignupBody.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  int screenId = 1;

  void update() {
    setState(() {
      screenId = screenId == 1 ? 2 : 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(!snapshot.hasData) {
            return Scaffold(
                backgroundColor: Colors.lightBlueAccent,
                body: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    SizedBox(
                      width: 250,
                      height:250,
                      child: Image.asset('assets/demo_logo2.png'),
                    ),
                    const Text("Finance Management", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Expanded(child: screenId == 1 ? LoginBody(updateCallback: update,) : SignupBody(updateCallback: update)),
                  ],
                ));
          } else {
            return HomeScreen();
          }}
    );
  }
}