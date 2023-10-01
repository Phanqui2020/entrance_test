import 'package:entrance_test/models/user_model.dart';

class SignInResponseModel {
  SignInResponseModel({
    this.user,
    this.accessToken,
    this.refreshToken,
  });

  SignInResponseModel.fromJson(dynamic json) {
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  UserModel? user;
  String? accessToken;
  String? refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['accessToken'] = accessToken;
    map['refreshToken'] = refreshToken;
    return map;
  }
}
