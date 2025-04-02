import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:erm_logic/constants/urls/authentication_urls.dart';
import 'package:erm_logic/exceptions/api_exception.dart';
import 'package:erm_logic/models/login_success_model.dart';
import 'package:erm_logic/utils/http_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) {});
    on<AuthenticateEvent>((event, emit) async {
      const secureStorage = FlutterSecureStorage();
      emit(Authenticating(msg: "Logging you in"));
      AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
        // sharedPreferencesName: 'Test2',
        // preferencesKeyPrefix: 'Test'
      );
      try {
        final Client client = http.Client();
        final String username = event.username;
        final String password = event.password;

        Uri login = Uri.parse(AuthenticationUrls.loginUrl);

        Map<String, dynamic> body = {
          "username": username,
          "password": password
        };
        Response res = await HttpUtils.post(login, client, body);
print(res.body);
        if(res.statusCode == 200){
          LoginSuccessModel success = LoginSuccessModel.fromJson(json.decode(res.body));
          final String token = success.token;
          await secureStorage.write(key: 'token', value: token);
          emit(Authenticated(msg: "Log in Successful"));
        }
        else{
          ApiException error = ApiException.fromJson(json.decode(res.body));
            emit(AuthenticationFailed(msg: error.error));
        }
      } catch (e) {
        throw Exception(e);
      }
    });
  }
}
