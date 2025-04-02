import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/repository_constants.dart';

class RepositoryHelpers {
  static Map<String, String> headers() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  static Future<Map<String, String>> authenticatedHeaders(
    SharedPreferences prefs,
  ) async {
    // final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(RepositoryConstants.tokenKey);
    var twoFactorCode = prefs.getString(RepositoryConstants.twoFactorCodeKey);
    var deviceToken = prefs.getString(RepositoryConstants.deviceToken);

    return {
      ...headers(),
      if (token != null) 'Authorization': 'Bearer $token',
      if (twoFactorCode != null) 'SECURITYCODE': twoFactorCode,
      if (deviceToken != null) 'DEVICETOKEN': deviceToken,
    };
  }

  static Future<Map<String, String>> plainAuthToken(SharedPreferences prefs) async {
    var token = prefs.getString(RepositoryConstants.tokenKey);
    return {'Authorization': 'Bearer $token'};
  }

  static Future<Map<String, String>> passwordResetHeaders(SharedPreferences prefs) async {
    final prefs = await SharedPreferences.getInstance();
    var resetPasswordToken = prefs.getString(RepositoryConstants.resetPasswordToken);
    return {
      ...headers(),
      if (resetPasswordToken != null) 'Authorization': 'Bearer $resetPasswordToken',
    };
  }

  static String parseUrl(String url, List<String> params) {
    for (String param in params) {
      url = url.replaceFirst('*', param);
    }
    return url;
  }
}
