import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnflutterapp/business_logic/BlocProviders.dart';
import 'package:learnflutterapp/common/constants/Constants.dart';
import 'package:learnflutterapp/ui/home/HomeScreen.dart';
import 'package:learnflutterapp/ui/welcome/pages/WelcomeScreen.dart';
import 'firebase_options.dart';
import 'ui/authentication/sign_in/SignIn.dart';
import 'ui/authentication/sign_up/SignUp.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlockProviders.allBlocProviders,
      child: MaterialApp(
        routes: {
          Constants.SIGN_IN_ROUTE: (context) => const SignIn(),
          Constants.SIGN_UP_ROUTE: (context) => const SignUp(),
          Constants.HOME_SCREEN_ROUTE: (context) => HomeScreen()
        },
        home:
            ScreenUtilInit(builder: (context, child) => const WelcomeScreen()),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
