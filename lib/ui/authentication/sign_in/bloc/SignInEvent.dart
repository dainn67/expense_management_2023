abstract class SignInEvent {
  SignInEvent();
}

class SignInEmailEvent extends SignInEvent {
  final String email;
  final String? inputError;

  SignInEmailEvent(this.email, this.inputError);
}

class PasswordEvent extends SignInEvent {
  final String password;

  PasswordEvent(this.password);
}

class PasswordErrorEvent extends SignInEvent {
  final String error;

  PasswordErrorEvent(this.error);
}
