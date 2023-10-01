import 'dart:io';

import 'package:entrance_test/Utils/api_urls.dart';
import 'package:http/http.dart' as http;

class Apis {
  final String url;
  final dynamic body;
  final String? accessToken;
  Map<String, String> defaultHeader = {
    'Content-Type': 'application/json',
    'Access-Control_Allow_Origin': '*',
    'Accept': 'application/json',
    'Connection': 'keep-alive',
  };

  Apis({required this.url, this.body, this.accessToken});

  Future<http.Response> post() {
    return http.post(
      Uri.parse(ApiUrls.baseUrl + url),
      body: body,
      headers: accessToken == null ? null : {HttpHeaders.authorizationHeader: 'Bearer $accessToken'},
    ).timeout(const Duration(minutes: 1));
  }

  Future<http.Response> get() {
    return http.get(
      Uri.parse(ApiUrls.baseUrl + url),
      headers: accessToken == null ? null : {HttpHeaders.authorizationHeader: 'Bearer $accessToken'},
    ).timeout(const Duration(minutes: 1));
  }
}
