import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Client, Response;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
import '../constants/repository_constants.dart';
import '../exceptions/api_exception.dart';

class HttpUtils {
  static Future<Response> get(
    Uri uri,
    Client client,
    SharedPreferences sharedPreferences,
  ) async {
    try {
      var authHeaders = await authenticatedHeaders(sharedPreferences);
      var response = await client
          .get(
            uri,
            headers: authHeaders,
          )
          .timeout(const Duration(seconds: 10));

      return response;
    } on TimeoutException {
      throw ApiException(error: 'The request took longer than expected.');
    }
  }

  static Future<Response> post(
    Uri uri,
    Client client,
    Map<String?, dynamic>? body,

  ) async {
    //var authHeaders = await authenticatedHeaders(sharedPreferences);
    String? requestBody;

    Map<String,String> headers = {
      "accept": "*/*",
      "Content-Type": "application/json"
    };

    if (body != null) {
      requestBody = jsonEncode(body);
    }

    // if (bodyString != null) {
    //   requestBody = bodyString;
    // }

    try {
      var response = await client.post(
        uri,
        headers: headers,
        body: requestBody,
      );
      return response;
    } on HttpException {
      throw ApiException(error: Constants.networkErrorMessage);
    }
  }

  static Future<Response> put(
    Uri uri,
    Client client,
    SharedPreferences sharedPreferences, {
    Map<String?, dynamic>? body,
  }) async {
    var authHeaders = await authenticatedHeaders(sharedPreferences);
    String? requestBody;

    if (body != null) {
      requestBody = jsonEncode(body);
    }

    var response = await client.put(
      uri,
      headers: authHeaders,
      body: requestBody,
    );

    return response;
  }

  static Future<Response> putHeadlines(
    Uri uri,
    Client client,
    SharedPreferences sharedPreferences, {
    String? body,
  }) async {
    var authHeaders = await authenticatedHeaders(sharedPreferences);
    String? requestBody;

    if (body != null) {
      requestBody = body;
    }

    var response = await client.put(
      uri,
      headers: authHeaders,
      body: requestBody,
    );

    return response;
  }

  static Future<Response> delete(
    Uri uri,
    Client client,
    SharedPreferences sharedPreferences, {
    Map<String?, dynamic>? body,
  }) async {
    var authHeaders = await authenticatedHeaders(sharedPreferences);
    String? requestBody;

    if (body != null) {
      requestBody = jsonEncode(body);
    }

    var response = await client.delete(
      uri,
      headers: authHeaders,
      body: requestBody,
    );

    return response;
  }

  static Map<String, String> headers() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  static Future<Map<String, String>> authenticatedHeaders(
    SharedPreferences prefs,
  ) async {
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
}
