import 'dart:convert';
import 'package:erm_logic/auth/auth_controller.dart';
import 'package:erm_logic/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SettingsRepository{


  Future addUser(c,firstname,lastname,username,email,phone,position,department)async{
 
    Constants().showDialogMethod(c,"Creating user, Please wait...");
    var url = Uri.parse('${Constants().baseUrl}/api/auth/register');

     var headers = {
    'Accept': 'application/json',
  };

   var userDetails = {
    "firstname": firstname, 
    "lastname": lastname, 
    "username": username, 
    "email": email,
    "phone":phone,
    "designation": position,
    "department": department,
    "roles": "1",
    "password": "123456"
  };

    http.Response response;
    if(firstname.isNotEmpty && lastname.isNotEmpty && username.isNotEmpty &&
      email.isNotEmpty && position.isNotEmpty && department.isNotEmpty){
        
       response = await http.post(url,body: userDetails,headers:headers);

        if(response.statusCode == 200){
      
          var data = jsonDecode(response.body);
          var token = data['accessToken'];
          await storage.write(key: 'token', value: token);
          Navigator.pop(c);
          return authError.sink.add(data['message']);
         //return Navigator.of(c).push(MaterialPageRoute(builder: ((context) => page)));
        }

    else{
       var data = jsonDecode(response.body);
       Navigator.pop(c);
      return authError.sink.add(data['message']);
    }
    }
    else{
      Navigator.pop(c);
      authError.sink.add('Enter all required fields');
    }

   
  }


   Future getMyProfile() async{
    var token = await storage.read(key: 'token');
    var url = Uri.parse('${Constants().baseUrl}/api/user');

     var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };
      http.Response response;
      response = await http.get(url,headers:headers);

        if(response.statusCode == 200){
          var data = jsonDecode(response.body);
          return data;
        }
    else{
       var data = jsonDecode(response.body);
       return data;
 
    }
       
  }

  Future getAllUsers() async{
    var token = await storage.read(key: 'token');
    var url = Uri.parse('${Constants().baseUrl}/api/users');

     var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };
      http.Response response;
      response = await http.get(url,headers:headers);

        if(response.statusCode == 200){
          var data = jsonDecode(response.body);
          return data;
        }
    else{
       var data = jsonDecode(response.body);
       return data;
 
    }
       
  }
  
}