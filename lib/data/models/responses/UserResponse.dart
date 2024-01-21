class UserResponse {
  final String createDate;
  final String createdBy;
  final String modifyDate;
  final String modifiedBy;
  final int id;
  final String gender;
  final String username;
  final bool accountNonExpired;
  final bool accountNonLocked;
  final bool active;
  final bool credentialsNonExpired;
  final String email;
  final String phone;
  final bool justCreated;
  final int lastLoginFailures;
  final String lastLoginTime;
  final int? totalLoginFailures;
  final int? orgId;
  final List<String> roles;
  final List<String> authorities;

  UserResponse({
    required this.createDate,
    required this.createdBy,
    required this.modifyDate,
    required this.modifiedBy,
    required this.id,
    required this.gender,
    required this.username,
    required this.accountNonExpired,
    required this.accountNonLocked,
    required this.active,
    required this.credentialsNonExpired,
    required this.email,
    required this.phone,
    required this.justCreated,
    required this.lastLoginFailures,
    required this.lastLoginTime,
    this.totalLoginFailures,
    this.orgId,
    required this.roles,
    required this.authorities,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      createDate: json['createDate'],
      createdBy: json['createdBy'],
      modifyDate: json['modifyDate'],
      modifiedBy: json['modifiedBy'],
      id: json['id'],
      gender: json['gender'],
      username: json['username'],
      accountNonExpired: json['accountNonExpired'],
      accountNonLocked: json['accountNonLocked'],
      active: json['active'],
      credentialsNonExpired: json['credentialsNonExpired'],
      email: json['email'],
      phone: json['phone'],
      justCreated: json['justCreated'],
      lastLoginFailures: json['lastLoginFailures'],
      lastLoginTime: json['lastLoginTime'],
      totalLoginFailures: json['totalLoginFailures'],
      orgId: json['orgId'],
      roles: List<String>.from(json['roles']),
      authorities: List<String>.from(json['authorities']),
    );
  }
}
