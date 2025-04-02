import 'environment_urls.dart';

class AuthenticationUrls {
  static final String _baseUrl = EnvironmentUrls.urls().baseUrl;
  static String loginUrl = '$_baseUrl/oauth/token';
}
