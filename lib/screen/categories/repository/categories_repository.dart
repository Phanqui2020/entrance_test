import 'dart:convert';

import 'package:entrance_test/Utils/api_urls.dart';
import 'package:entrance_test/Utils/share_pref.dart';
import 'package:entrance_test/Utils/share_pref_key.dart';
import 'package:entrance_test/apis/apis.dart';
import 'package:entrance_test/models/user_model.dart';
import 'package:entrance_test/screen/categories/model/categories_response_model.dart';
import 'package:entrance_test/screen/sign_up/model/sign_up_request_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesRepository {
  Future<List<CategoriesResponseModel>> getCategories() async {
    List<CategoriesResponseModel> listCategories = [];
    try {
      final accessToken = await SharePref.get(SharePrefKey.ACCESS_TOKEN, SharePrefType.STRING);
      Apis api = Apis(url: ApiUrls.getCategories, accessToken: accessToken);
      await api.get().then((value) {
        List<dynamic> response = json.decode(value.body);
        for(var item in response){
          listCategories.add(CategoriesResponseModel.fromJson(item));
        }
      });
      return listCategories;
    } catch (e) {
      print(e);
      return listCategories;
    }
  }
}
