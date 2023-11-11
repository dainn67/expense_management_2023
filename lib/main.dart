import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learnflutterapp/Authentication/AuthPage.dart';
import 'package:learnflutterapp/Home/HomeScreen.dart';
import 'package:learnflutterapp/firebase_options.dart';
import 'package:learnflutterapp/provider/DataProvider.dart';
import 'package:learnflutterapp/provider/RecordsProvider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RecordsProvider()),
        ChangeNotifierProvider(create: (context) => DataProvider())
      ],
      child: const MaterialApp(
        home: AuthPage(),
        // home: HomeScreen(),
      ),
    );
  }
}