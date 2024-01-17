import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnflutterapp/ui/authentication/sign_up/bloc/RegisterBloc.dart';

import '../ui/authentication/sign_in/bloc/SignInBloc.dart';
import '../ui/welcome/bloc/WelcomeBloc.dart';
import '../ui/home/bloc/MainBlocs.dart';

class AppBlockProviders{
  static get allBlocProviders => [
    BlocProvider(create: (context) => WelcomeBloc()),
    BlocProvider(lazy: true, create: (context) => SignInBloc()),
    BlocProvider(lazy: true, create: (context) => RegisterBloc()),
    BlocProvider(lazy: true, create: (context) => AppBloc()),
  ];
}