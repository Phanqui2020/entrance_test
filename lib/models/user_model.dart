class UserModel {
  UserModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.email,
    this.firstName,
    this.lastName,
    this.role,});

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    role = json['role'];
  }
  int? id;
  String? createdAt;
  String? updatedAt;
  String? email;
  String? firstName;
  String? lastName;
  String? role;
  UserModel copyWith({  int? id,
    String? createdAt,
    String? updatedAt,
    String? email,
    String? firstName,
    String? lastName,
    String? role,
  }) => UserModel(  id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    email: email ?? this.email,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    role: role ?? this.role,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['email'] = email;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['role'] = role;
    return map;
  }

}