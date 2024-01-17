import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnflutterapp/ui/authentication/sign_in/bloc/SignInEvent.dart';
import 'package:learnflutterapp/ui/authentication/sign_in/bloc/SignInState.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState>{
  SignInBloc(): super(SignInState()){

    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);

  }

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit){
    //.copyWith: create a new instance of the state with updated values
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit){
    //.copyWith: create a new instance of the state with updated values
    emit(state.copyWith(password: event.password));
  }
}