import 'dart:convert';

import 'package:erm_logic/auth/auth_controller.dart';
import 'package:erm_logic/helpers/constants.dart';
import 'package:http/http.dart' as http;



class SettingsRepository{
  Future getAllRisks() async{
    var token = await storage.read(key: 'token');
    var url = Uri.parse('${Constants().baseUrl}/api/risks');

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