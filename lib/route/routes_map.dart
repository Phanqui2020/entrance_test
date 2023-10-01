import 'package:entrance_test/screen/categories/screen/categories_screen.dart';
import 'package:entrance_test/screen/sign_up/screen/sign_up_screen.dart';
import 'package:get/get.dart';

const String signIn = '/sign_in';
const String signUp = '/sign_up';
const String categories = '/categories';

final routesMap = [
  GetPage(name: signUp, page: () => const SignUpScreen()),
  GetPage(
      name: categories,
      page: () => const CategoriesScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 300)),
];
