import 'dart:convert';
import 'package:erm_logic/auth/auth_controller.dart';
import 'package:erm_logic/helpers/constants.dart';
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

  Future getRiskRating() async{
    var token = await storage.read(key: 'token');
    int id = singleRiskData['id'];
    var url = Uri.parse('${Constants().baseUrl}/api/riskrating/$id');

     var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };
      http.Response response;
      response = await http.get(url,headers:headers);

        if(response.statusCode == 200){
          var data = jsonDecode(response.body);
          print(data);
          riskRatingController.sink.add(data);
          return data;
        }
    else{
       var data = jsonDecode(response.body);
       return data;
 
    }
       
  }
  
}