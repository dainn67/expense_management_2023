class SignInState {
  final String email;
  final String password;
  final String? emailError;
  final String? passwordError;

  const SignInState(
      {this.email = '',
      this.password = '',
      this.emailError,
      this.passwordError});

  SignInState copyWith(
      {
      //optional named params: params that are not required to pass but can
      String? email,
      String? password,
      String? emailError,
      String? passwordError}) {

    //create new objects with passed in data, the remaining don't change
    return SignInState(
        email: email ?? this.email,
        password: password ?? this.password,
        emailError: emailError,
        passwordError: passwordError);
  }
}
