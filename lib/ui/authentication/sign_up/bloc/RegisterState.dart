class RegisterState {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;

  const RegisterState(
      {this.username = "",
      this.email = "",
      this.password = "",
      this.confirmPassword = ""});

  RegisterState copyWith({
      //optional named params: params that are not required to pass but can
      String? username,
      String? email,
      String? password,
      String? confirmPassword}) {

    //create new objects with passed in data, the remaining don't change
    return RegisterState(
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword);
  }
}
