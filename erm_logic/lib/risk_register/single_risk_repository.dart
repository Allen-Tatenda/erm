import 'dart:convert';

import 'package:erm_logic/auth/auth_controller.dart';
import 'package:erm_logic/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SingleRiskRepository{

   Future getRiskById() async{
    var token = await storage.read(key: 'token');
    int id = singleRiskData['id'];
    var url = Uri.parse('${Constants().baseUrl}/api/risks/$id');

     var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };
      http.Response response;
      response = await http.get(url,headers:headers);

        if(response.statusCode == 200){
          var data = jsonDecode(response.body);
          riskConsequencesController.sink.add(data);
          return data;
        }
    else{
       var data = jsonDecode(response.body);
       return data;
 
    }
       
  }

   Future getConsequencesByRiskId() async{
    var token = await storage.read(key: 'token');
    int id = singleRiskData['id'];
    var url = Uri.parse('${Constants().baseUrl}/api/consequences/$id');

     var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };
      http.Response response;
      response = await http.get(url,headers:headers);

        if(response.statusCode == 200){
          var data = jsonDecode(response.body);
          riskConsequencesController.sink.add(data);
          return data;
        }
    else{
       var data = jsonDecode(response.body);
       return data;
 
    }
       
  }

  Future addConsequence(c,consequence,description) async{
    Constants().showDialogMethod(c,"Processing, Please wait...");
    var token = await storage.read(key: 'token');
    var myId = await storage.read(key: 'myId');
    int id = singleRiskData['id'];
    var url = Uri.parse('${Constants().baseUrl}/api/consequence');

     var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };
  
   var body = {
      'risk_id': id.toString(),
      'added_by': myId.toString(),
      'consequence': consequence.toString(),
      'description':  description.toString()
  };
      http.Response response;
      response = await http.post(url,body:body, headers:headers);

        if(response.statusCode == 200){
          var data = jsonDecode(response.body);
          Navigator.pop(c);
          return data;
        }
    else{
       var data = jsonDecode(response.body);
       Navigator.pop(c);
       return data;
 
    }
       
  }

   Future getRiskCausesByRiskId() async{
    var token = await storage.read(key: 'token');
    int id = singleRiskData['id'];
    var url = Uri.parse('${Constants().baseUrl}/api/causes/$id');

     var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };
      http.Response response;
      response = await http.get(url,headers:headers);

        if(response.statusCode == 200){
          var data = jsonDecode(response.body);
          riskConsequencesController.sink.add(data);
          return data;
        }
    else{
       var data = jsonDecode(response.body);
       return data;
 
    }
       
  }

  Future addRiskCause(c,cause,description) async{
    Constants().showDialogMethod(c,"Processing, Please wait...");
    var token = await storage.read(key: 'token');
    var myId = await storage.read(key: 'myId');
    int id = singleRiskData['id'];
    var url = Uri.parse('${Constants().baseUrl}/api/cause');

     var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };
  
   var body = {
      'risk_id': id.toString(),
      'added_by': myId.toString(),
      'cause': cause.toString(),
      'description':  description.toString()
  };
      http.Response response;
      response = await http.post(url,body:body, headers:headers);

        if(response.statusCode == 200){
          var data = jsonDecode(response.body);
          Navigator.pop(c);
          return data;
        }
    else{
       var data = jsonDecode(response.body);
       Navigator.pop(c);
       return data;
 
    }
       
  }





   Future getRiskResponseByRiskId() async{
    var token = await storage.read(key: 'token');
    int id = singleRiskData['id'];
    var url = Uri.parse('${Constants().baseUrl}/api/riskresponse/$id');

     var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };
      http.Response response;
      response = await http.get(url,headers:headers);

        if(response.statusCode == 200){
          var data = jsonDecode(response.body);
          riskConsequencesController.sink.add(data);
          return data;
        }
    else{
       var data = jsonDecode(response.body);
       return data;
 
    }
       
  }

  Future addRiskResponse(c,riskResponse) async{
    Constants().showDialogMethod(c,"Processing, Please wait...");
    var token = await storage.read(key: 'token');
    var myId = await storage.read(key: 'myId');
    int id = singleRiskData['id'];
    var url = Uri.parse('${Constants().baseUrl}/api/riskresponse');

     var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };
  
   var body = {
      'risk_id': id.toString(),
      'added_by': myId.toString(),
      'risk_response': riskResponse.toString(),
  };
      http.Response response;
      response = await http.post(url,body:body, headers:headers);

        if(response.statusCode == 200){
          var data = jsonDecode(response.body);
          Navigator.pop(c);
          return data;
        }
    else{
       var data = jsonDecode(response.body);
       Navigator.pop(c);
       return data;
 
    }
       
  }

}