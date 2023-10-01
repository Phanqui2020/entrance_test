

import 'dart:convert';

import 'package:entrance_test/Utils/api_urls.dart';
import 'package:entrance_test/apis/apis.dart';
import 'package:entrance_test/models/user_model.dart';
import 'package:entrance_test/screen/sign_up/model/sign_up_request_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpRepository {
  Future<bool> signUp({required SignUpRequestModel body}) async {
    bool isSuccess = false;
    try {
      Apis request = Apis(url: ApiUrls.signUp, body: body.toJson());
      await request.post().then((value) {
        bool hasError = json.decode(value.body)["statusCode"] != null;
        if(!hasError){
          isSuccess = true;
        }else {
          isSuccess = false;
        }
      });
      return isSuccess;
    }catch (e){
      print(e);
      return false;
    }
  }

}