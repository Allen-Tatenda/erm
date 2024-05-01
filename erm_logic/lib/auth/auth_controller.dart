import 'dart:convert';

import 'package:erm_logic/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

final storage = const FlutterSecureStorage();

class AuthController{


// Obtain shared preferences.


  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
        // sharedPreferencesName: 'Test2',
        // preferencesKeyPrefix: 'Test'
      );

  Future<dynamic> login(String email,String password,c,Widget page) async{
    var url = Uri.parse('${Constants().baseUrl}/api/auth/login');

     var headers = {
    'Accept': 'application/json',
  };
    http.Response response;
    if(email.isNotEmpty && password.isNotEmpty){
       response = await http.post(url,body: {"email": email, "password": password},headers:headers);

        if(response.statusCode == 200){
      
          var data = jsonDecode(response.body);
          var token = data['accessToken'];
          await storage.write(key: 'token', value: token);
          Navigator.pop(c);
          Navigator.of(c).push(MaterialPageRoute(builder: ((context) => page)));
        }

    else{
       var data = jsonDecode(response.body);
      return loginError.sink.add(data['message']);
    }
    }{
      if(email.isEmpty){
        loginError.sink.add('Email cannot be Empty');
      }
      else if(password.isEmpty){
        loginError.sink.add('Password cannot be Empty');
      }
    }

   
  }


Future<dynamic> getSession(c,Widget loggedin,Widget loggedOut,Widget setPassword) async{
  var token = await storage.read(key: 'token');
  var url = Uri.parse('${Constants().baseUrl}/api/auth/user');

     var headers = {
     'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };
    http.Response response;
       response = await http.get(url,headers:headers);
        if(response.statusCode == 200){  
          var data = jsonDecode(response.body);
          if( data['password_set'] == 0){
            Navigator.pop(c);
            return Navigator.of(c).push(MaterialPageRoute(builder: ((context) => setPassword)));
          }
        
          Navigator.pop(c);
          Navigator.of(c).push(MaterialPageRoute(builder: ((context) => loggedin)));
        }
        else{
           Navigator.pop(c);
          Navigator.of(c).push(MaterialPageRoute(builder: ((context) => loggedOut)));
        }
   
  }



  Future<dynamic> splashScreen(c,Widget loggedInPage,Widget signedOutPage,Widget setPassword) async{
    var value = await storage.read(key: 'token');
    //print ('value $value');
    Future.delayed(const Duration(seconds: 4),(){
      if(value != null){
        getSession(c, loggedInPage, signedOutPage, setPassword);
      }
      else{
        Navigator.pop(c);
        return Navigator.of(c).push(MaterialPageRoute(builder: ((c) => signedOutPage)));
      }
    });
  }

  Future<dynamic> logout(c,Widget splash) async{

     var token = await storage.read(key: 'token');
  var url = Uri.parse('${Constants().baseUrl}/api/auth/logout');

     var headers = {
     'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };
    http.Response response;
       response = await http.get(url,headers:headers);
        if(response.statusCode == 200){ 
           await storage.deleteAll(
              aOptions: _getAndroidOptions(),
            );
            Navigator.pop(c);
            Navigator.of(c).push(MaterialPageRoute(builder: ((context) => splash)));
         }
    
  }


Future<dynamic> changePassword(String oldPassword,String newPassword,c,splash) async{

     var token = await storage.read(key: 'token');
  var url = Uri.parse('${Constants().baseUrl}/api/auth/password');

     var headers = {
     'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };
    http.Response response;
       response = await http.post(url,headers:headers,body: {"current_password":oldPassword,"new_password":newPassword});
        if(response.statusCode == 200){ 
            Navigator.of(c).push(MaterialPageRoute(builder: ((context) => splash)));
         }
         print(response.body);
  }
}