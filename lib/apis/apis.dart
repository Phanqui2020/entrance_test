import 'package:entrance_test/Utils/api_urls.dart';
import 'package:http/http.dart' as http;

class Apis{

  final String url;
  final dynamic body;

  Apis({required this.url, this.body});

  Future<http.Response> post() {
    return http.post(Uri.parse(ApiUrls.baseUrl + url), body: body).timeout(const Duration(minutes: 1));
  }
  Future<http.Response> get() {
    return http.get(Uri.parse(ApiUrls.baseUrl + url)).timeout(const Duration(minutes: 1));
  }
}