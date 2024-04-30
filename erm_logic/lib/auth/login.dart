import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class Login{
final storage = new FlutterSecureStorage();

  Future<dynamic> login() async{
    var url = Uri.parse('http://127.0.0.1:8000/api/auth/login');

    var response = await http.post(url,body: {"email": 'anjiva7@gmail.com', "password": '123456'});

    if(response.statusCode == 200){
      
      var data = jsonDecode(response.body);
      var token = data['accessToken'];
      //print(token);
      //await storage.write(key: 'token', value: token);

      var value = await storage.read(key: 'token');
      print(value);
    }

    
  
  }
}