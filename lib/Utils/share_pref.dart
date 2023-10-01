import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

enum SharePrefType {
  BOOL,
  DOUBLE,
  INT,
  STRING,
  OBJECT,
}

/// Handle the [SharedPreferences]
class SharePref {
  /// Get data
  /// EX:
  /// await SharePref.getSharePref(SharePrefKey.ACCESS_TOKEN, SharePrefType.STRING)
  static dynamic get(String key, SharePrefType type) async {
    final prefs = await SharedPreferences.getInstance();
    switch (type) {
      case SharePrefType.BOOL:
        return prefs.getBool(key);
      case SharePrefType.STRING:
        return prefs.getString(key);
      case SharePrefType.DOUBLE:
        return prefs.getDouble(key);
      case SharePrefType.INT:
        return prefs.getInt(key);
      // case SharePrefType.OBJECT:
      //   return prefs.getString(key);
      default:
        return null;
    }
  }

  /// Save data
  /// EX:
  /// await SharePref.put(SharePrefKey.ACCESS_TOKEN, accessToken);
  static put(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    // if (key.startsWith(CacheConfig.CACHE_TAG)) {
    //   throw Exception('key is not allowed to starts with the word \'cache\'');
    // }
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is double) {
      prefs.setDouble(key, value);
    }
  }


  static getObjectWithKey(String key) async {
    final result = await get(key, SharePrefType.STRING);
    if (result == null) {
      return null;
    }
    return jsonDecode(result);
  }

  static Future<Future<bool>?> putObjectList(
      String key, List<Object> list) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> _dataList = list.map((value) {
      return json.encode(value);
    }).toList();
    return prefs.setStringList(key, _dataList);
  }

  static List<T>? getObjList<T>(String key, T f(Map v),
      {List<T> defValue = const []}) {
    final prefs = SharedPreferences.getInstance();
    List<Map>? dataList = getObjectList(key) as List<Map>?;
    List<T> list = dataList!.map((value) {
      return f(value);
    }).toList();
    return list;
  }

  static Future<List>? getObjectList(String key) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? dataList = prefs.getStringList(key);
    if (dataList == null) {
      return [];
    }
    return dataList.map((value) {
      Map dataMap = json.decode(value);
      return dataMap;
    }).toList();
  }

  static void remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  static Future<SharedPreferences> getPrefsInstance() {
    return SharedPreferences.getInstance();
  }
}
