class SignUpRequestModel {
  SignUpRequestModel({
    this.email,
    this.password,
    this.firstName,
    this.lastName,
  });

  String? email;
  String? password;
  String? firstName;
  String? lastName;

  SignUpRequestModel copyWith({
    String? email,
    String? password,
    String? firstName,
    String? lastName,
  }) =>
      SignUpRequestModel(
        email: email ?? this.email,
        password: password ?? this.password,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    map['firstName'] = firstName ?? "Tester";
    map['lastName'] = lastName ?? "Mr";
    return map;
  }
}
