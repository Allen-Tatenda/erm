import 'dart:convert';
import 'package:erm_logic/auth/auth_controller.dart';
import 'package:erm_logic/helpers/constants.dart';
import 'package:erm_logic/risk_register/models/risk_model.dart';
import 'package:http/http.dart' as http;



class RiskRegisterRepository{
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