import 'dart:core';

class TokenResponse {
  //@SerializedName("access_token")
  String? accessToken;

  //@SerializedName("refresh_token")
  String? refreshToken;

  //@SerializedName("expires_in")
  int? expiresIn;

  //@SerializedName("user")
  String? user;
  //: CheckUser

  TokenResponse({this.accessToken, this.refreshToken, this.expiresIn, this.user});
}