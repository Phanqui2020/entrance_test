import 'package:entrance_test/Utils/app_text_style.dart';
import 'package:entrance_test/Utils/device_dimension.dart';
import 'package:entrance_test/route/routes_map.dart';
import 'package:entrance_test/screen/sign_up/controller/sign_up_controller.dart';
import 'package:entrance_test/screen/sign_up/page/widgets/confirm_age_widget.dart';
import 'package:entrance_test/screen/sign_up/page/widgets/input_field_widget.dart';
import 'package:entrance_test/screen/sign_up/page/widgets/password_status_text_widget.dart';
import 'package:entrance_test/widget/enable_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final SignUpController _controller;

  @override
  void initState() {
    _controller = Get.put(SignUpController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image(image: AssetImage('assets/images/background.jpeg'), fit: BoxFit.cover),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: DeviceDimension.screenHeight*0.7,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0x1D0C0B0B),
                    Colors.black,
                    Colors.black,
                    Colors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Form(
                key: _controller.signupFormKey,
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Let’s get you started!",
                          style: AppTextStyle.titleLarge,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InputFieldWidget(
                          textInputType: TextInputType.emailAddress,
                          hintText: "Your email",
                          controller: _controller.emailController,
                          onTextChange: (value) {
                            _controller.isEnable();
                          },
                          onValidationText: (value) =>
                              _controller.emailValidator(value),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InputFieldWidget(
                            hintText: "Your password",
                            controller: _controller.passwordController,
                            onTextChange: (value) {
                              _controller.isEnable();
                              _controller.passwordStrength();
                            },
                            onValidationText: (value) =>
                                _controller.passwordValidator(value),
                            secureText: true),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Obx(
                                () => PasswordStatusTextWidget(
                              text: _controller.textPasswordStatus.value,
                              textStyle: AppTextStyle.bodySmall
                                  .copyWith(color: _controller.getColorText()),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const ConfirmAgeWidget(),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text:
                                  "By clicking Sign Up, you are indicating that you have read and agree to the ",
                                  style: AppTextStyle.bodySmall.copyWith(
                                      color: Colors.white.withOpacity(0.5))),
                              TextSpan(
                                  text: "Terms of Service ",
                                  style: AppTextStyle.bodySmall
                                      .copyWith(color: const Color(0xFF647FFF))),
                              TextSpan(
                                  text: "and ",
                                  style: AppTextStyle.bodySmall.copyWith(
                                      color: Colors.white.withOpacity(0.5))),
                              TextSpan(
                                  text: "Privacy Policy",
                                  style: AppTextStyle.bodySmall
                                      .copyWith(color: const Color(0xFF647FFF))),
                            ])),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // action
                              },
                              child: Text(
                                "Sign Up",
                                style: AppTextStyle.bodyLarge
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                            ),
                            Obx(
                                  () {
                                return EnableWidget(
                                  enable: _controller.isEnableNext.value,
                                  child: GestureDetector(
                                    // onTap: () => Get.toNamed(categories),
                                    onTap: () => _controller.signUp(),
                                    child: Container(
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: const Color(0xFF647FFF))),
                                      child: const Image(
                                          image: AssetImage(
                                              "assets/images/arrow_sign_in.png")),
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
