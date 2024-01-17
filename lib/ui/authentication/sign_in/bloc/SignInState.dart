class SignInState {
  final String email;
  final String password;

  const SignInState({this.email = "", this.password = ""});

  SignInState copyWith({
      //optional named params: params that are not required to pass but can
      String? email,
      String? password}) {

    //create new objects with passed in data, the remaining don't change
    return SignInState(
        email: email ?? this.email, password: password ?? this.password);
  }
}
