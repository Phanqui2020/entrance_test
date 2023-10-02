import 'package:entrance_test/Utils/Regex.dart';
import 'package:entrance_test/Utils/share_pref.dart';
import 'package:entrance_test/Utils/share_pref_key.dart';
import 'package:entrance_test/route/routes_map.dart';
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
  RxString textPasswordStatus = ''.obs;
  RxInt styleTextPasswordStatus = 0.obs;
  RxBool isEnableNext = false.obs;

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

    if (!Regex.regEmail.hasMatch(value!)) {
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
    if (!Regex.regLength.hasMatch(value!)) {
      return ("The password must be between 6-18 characters");
    }

    return null;
  }

  passwordStrength() {
    final value = passwordController.text.trim();

    if (value.isEmpty || value.length < 6) {
      textPasswordStatus.value = "Too Short";
      styleTextPasswordStatus.value = 0;
    } else {
      if (Regex.regUpperLetter.hasMatch(value) &&
          Regex.regLowerLetter.hasMatch(value)) {
        if (Regex.regNumber.hasMatch(value)) {
          if (Regex.regCharacter.hasMatch(value)) {
            textPasswordStatus.value = "Strong";
            styleTextPasswordStatus.value = 4;
          } else {
            textPasswordStatus.value = "Good";
            styleTextPasswordStatus.value = 3;
          }
        } else {
          textPasswordStatus.value = "Fair";
          styleTextPasswordStatus.value = 2;
        }
      } else {
        textPasswordStatus.value = "Weak";
        styleTextPasswordStatus.value = 1;
      }
    }
  }

  Color getColorText() {
    final value = styleTextPasswordStatus.value;
    Color color = Colors.white.withOpacity(0.5);
    switch(value){
      case 1:
        color = const Color(0xFFE05151);
        break;
      case 2:
        color = const Color(0xFFE3A063);
        break;
      case 3:
        color = const Color(0xFF647FFF);
        break;
      case 4:
        color = const Color(0xFF91E2B7);
        break;
      default:
        color = Colors.white.withOpacity(0.5);
        break;
    }
    return color;
  }

  isEnable() {
    //empty check
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      isEnableNext(isEnableNext.value = true);
    } else {
      isEnableNext(isEnableNext.value = false);
    }
  }

  void signUp() async {
    try {
      if (signupFormKey.currentState!.validate()) {
        Future.delayed(
            Duration.zero,
            () => Get.dialog(const Center(child: CircularProgressIndicator()),
                barrierDismissible: false));

        final email = emailController.text.trim();
        final password = passwordController.text.trim();
        await SignUpRepository()
            .signUp(body: SignUpRequestModel(email: email, password: password))
            .then((isSuccess) async {
          if (isSuccess) {
            final response = await SignInRepository().signIn(
                body: SignInRequestModel(email: email, password: password));
            if (response != null) {
              await SharePref.put(
                  SharePrefKey.ACCESS_TOKEN, response.accessToken);
              await SharePref.put(
                  SharePrefKey.REFRESH_TOKEN, response.accessToken);
              Get.back();
              Get.toNamed(categories);
            } else {
              Get.back();
              Get.snackbar('Signing up...', 'Sign up Failed');
            }
          } else {
            Get.back();
            Get.snackbar('Signing up...', 'Sign up Failed');
          }
        });
      }
    } on Exception catch (e) {
      print(e);
      Get.back();
      Get.snackbar('Signing up...', 'Sign up Failed');
    }
  }
}
