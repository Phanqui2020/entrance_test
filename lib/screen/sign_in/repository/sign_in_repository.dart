import 'dart:convert';

import 'package:entrance_test/Utils/api_urls.dart';
import 'package:entrance_test/apis/apis.dart';
import 'package:entrance_test/screen/sign_in/model/sign_in_request_model.dart';
import 'package:entrance_test/screen/sign_in/model/sign_in_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInRepository {
  Future<SignInResponseModel?> signIn({required SignInRequestModel body}) async {
    SignInResponseModel responseModel = SignInResponseModel();
    try {
      Future.delayed(
          Duration.zero,
              () => Get.dialog(const Center(child: CircularProgressIndicator()),
              barrierDismissible: false));
      Apis request = Apis(url: ApiUrls.signIn, body: body.toJson());
      await request.post().then((value) {
        responseModel = SignInResponseModel.fromJson(json.decode(value.body));
        Get.back();
        return responseModel;
      }).catchError((onError) {
        print(onError);
        return null;
      });
      return responseModel;
    }catch (e){
      print(e);
      return null;
    }
  }

}