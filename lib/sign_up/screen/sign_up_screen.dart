import 'package:entrance_test/Utils/app_text_style.dart';
import 'package:entrance_test/Utils/device_dimension.dart';
import 'package:entrance_test/sign_up/screen/widgets/confirm_age_widget.dart';
import 'package:entrance_test/sign_up/screen/widgets/input_field_widget.dart';
import 'package:entrance_test/sign_up/screen/widgets/privacy_text_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   DeviceDimension().init(context);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              height: 150,
              child: Image(
                  image: AssetImage('assets/images/sign_up_background.jpg'),
                  fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Let’s get you started!",
                    style: AppTextStyle.titleLarge,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Your email",
                    style: AppTextStyle.bodySmall
                        .copyWith(color: Colors.white.withOpacity(0.5)),
                  ),
                  InputFieldWidget(
                      controller: emailController,
                      onTextChange: (value) {},
                      onValidationText: (value) {},
                      secureText: false),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Your password",
                    style: AppTextStyle.bodySmall
                        .copyWith(color: Colors.white.withOpacity(0.5)),
                  ),
                  InputFieldWidget(
                      controller: passwordController,
                      onTextChange: (value) {},
                      onValidationText: (value) {},
                      secureText: true),
                  const SizedBox(
                    height: 40,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const ConfirmAgeWidget(),
                  const SizedBox(
                    height: 10,
                  ),
                  PrivacyTextWidget(
                    text:
                        "By clicking Sign Up, you are indicating that you have read and agree to the Terms of Service and Privacy Policy",
                    highlight: const ["Terms of Service", "Privacy Policy"],
                    style: AppTextStyle.bodySmall
                        .copyWith(color: Colors.white.withOpacity(0.5)),
                    highlightStyle: AppTextStyle.bodySmall
                        .copyWith(color: const Color(0xFF647FFF)),
                  ),
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
                      GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: const Color(0xFF647FFF))),
                          child: const Image(
                              image: AssetImage(
                                  "assets/images/arrow_sign_in.png")),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
