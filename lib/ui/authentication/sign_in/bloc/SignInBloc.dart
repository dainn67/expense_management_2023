import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnflutterapp/ui/authentication/sign_in/bloc/SignInEvent.dart';
import 'package:learnflutterapp/ui/authentication/sign_in/bloc/SignInState.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<SignInEmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);

    on<PasswordErrorEvent>(_passwordErrorEvent);
  }

  //.copyWith: create a new instance of the state with updated values
  void _emailEvent(SignInEmailEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email, emailError: event.inputError));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _passwordErrorEvent(
      PasswordErrorEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(passwordError: event.error));
  }
}
