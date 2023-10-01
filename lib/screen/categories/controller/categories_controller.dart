import 'dart:convert';

import 'package:entrance_test/Utils/share_pref.dart';
import 'package:entrance_test/Utils/share_pref_key.dart';
import 'package:entrance_test/screen/categories/model/categories_response_model.dart';
import 'package:entrance_test/screen/categories/repository/categories_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  final scrollController = ScrollController();
  List<CategoriesResponseModel> listCategory = [];
  List<String> listSelectedCategory = [];
  RxBool isEnableNextScene = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  onItemClick({int? index}) {
    if (index != null) {
      listCategory[index].isSelected = !listCategory[index].isSelected;
      update();

      if (listCategory[index].isSelected) {
        listSelectedCategory.add(listCategory[index].name ?? "");
      } else {
        if (listSelectedCategory.contains(listCategory[index].name)) {
          listSelectedCategory.remove(listCategory[index].name);
        }
      }
      isEnable();
    }
  }

  isEnable() {
    if (listSelectedCategory.isNotEmpty) {
      isEnableNextScene(isEnableNextScene.value = true);
    }else {
      isEnableNextScene(isEnableNextScene.value = false);
    }
  }

  Future getCategories() async {
    Future.delayed(
        Duration.zero,
        () => Get.dialog(const Center(child: CircularProgressIndicator()),
            barrierDismissible: false));
    final response = await CategoriesRepository().getCategories();
    listCategory.addAll(response);
    Get.back();
    update();
  }

  Future saveCategories() async {
    try {
      if (listSelectedCategory.isNotEmpty) {
        await SharePref.putObjectList(
            SharePrefKey.SELECTED_CATEGORIES, listSelectedCategory);
        Get.snackbar("Save Categories", "Save Successful!");
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
