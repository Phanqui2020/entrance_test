import 'package:get/get.dart';

import '../screen/categories/page/categories_screen.dart';
import '../screen/sign_up/page/sign_up_screen.dart';

const String signIn = '/sign_in';
const String signUp = '/sign_up';
const String categories = '/categories';

final routesMap = [
  GetPage(
      name: signUp,
      page: () => const SignUpScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500)),
  GetPage(
      name: categories,
      page: () => const CategoriesScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500)),
];
