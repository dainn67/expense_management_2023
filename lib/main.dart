import 'package:flutter/material.dart';
import 'package:learnflutterapp/Home/HomeScreen.dart';
import 'package:learnflutterapp/provider/DataProvider.dart';
import 'package:learnflutterapp/provider/RecordsProvider.dart';
import 'package:provider/provider.dart';
import 'Authentication/LoginBody.dart';
import 'Authentication/SignupBody.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RecordsProvider()),
        ChangeNotifierProvider(create: (context) => DataProvider())
      ],
      child: MaterialApp(
        // home: LoginScreen(),
        home: HomeScreen(),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int screenId = 1;

  void update() {
    setState(() {
      screenId = screenId == 1 ? 2 : 1;
    });
  }

  @override
  Widget build(BuildContext context) {
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
  }
}