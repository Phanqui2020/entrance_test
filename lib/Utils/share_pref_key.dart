// ignore_for_file: non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

/// All the keys of [SharedPreferences]
class SharePrefKey {
  SharePrefKey._();

  static String USERNAME = 'username';
  static String PASSWORD = 'password';
  static String ACCESS_TOKEN = 'auth_token';
  static String REFRESH_TOKEN = 'refresh_token';
  static String SELECTED_CATEGORIES = 'selected_categories';
}
