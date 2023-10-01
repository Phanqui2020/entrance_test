import 'package:entrance_test/Utils/share_pref.dart';
import 'package:entrance_test/Utils/share_pref_key.dart';
import 'package:entrance_test/screen/categories/screen/categories_screen.dart';
import 'package:entrance_test/screen/sign_in/model/sign_in_request_model.dart';
import 'package:entrance_test/screen/sign_in/repository/sign_in_repository.dart';
import 'package:entrance_test/screen/sign_up/model/sign_up_request_model.dart';
import 'package:entrance_test/screen/sign_up/repository/sign_up_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final signupFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isEnableNext = true;

  @override
  void onInit() {
    emailController.text = '';
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? emailValidator(String? value) {
    // empty check
    if (value != null && value.isEmpty) {
      return 'Please this field must be filled';
    }

    // valid email check
    RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regex.hasMatch(value!)) {
      return ("Please enter the valid email");
    }

    return null;
  }

  String? passwordValidator(String? value) {
    //empty check
    if (value != null && value.isEmpty) {
      return 'Please this field must be filled';
    }

    // valid password check
    RegExp regex = RegExp(r'^.{6,18}$');
    if (!regex.hasMatch(value!)) {
      return ("The password must be between 6-18 characters");
    }

    return null;
  }

  void login() async {
    if (signupFormKey.currentState!.validate()) {
      Future.delayed(
          Duration.zero,
              () => Get.dialog(const Center(child: CircularProgressIndicator()),
              barrierDismissible: false));
      await signUp(emailController.text, passwordController.text)
          .then((auth) async {
        if (auth) {
          Get.snackbar('Signing up...', 'Sign up successfully, signing in... ');
          final response = await SignInRepository().signIn(
              body: SignInRequestModel(
                  email: emailController.text,
                  password: passwordController.text));
          if(response!= null){
            await SharePref.put(SharePrefKey.ACCESS_TOKEN, response.accessToken);
            await SharePref.put(SharePrefKey.REFRESH_TOKEN, response.accessToken);
            Get.back();
            Get.to(const CategoriesScreen());
          }else {
            Get.snackbar('Signing in...', 'Sign in Failed');
          }
        } else {
          Get.snackbar('Signing up...', 'Sign Up Failed');
        }
      });
    }
  }

  // Api
  Future<bool> signUp(String email, String password) async {
    final response = await SignUpRepository()
        .signUp(body: SignUpRequestModel(email: email, password: password));
    return Future.value(response);
  }
}
