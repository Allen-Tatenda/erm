import 'dart:convert';
import 'package:erm_logic/auth/auth_controller.dart';
import 'package:erm_logic/helpers/constants.dart';
import 'package:flutter/material.dart';
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
          riskRatingController.sink.add(data);
          return data;
        }
    else{
       var data = jsonDecode(response.body);
       riskRatingController.sink.add(data);
       return data;
 
    }
       
  }

  Future editRiskRating(c,likelihood,impact) async{
    Constants().showDialogMethod(c,"Processing, Please wait...");
    var token = await storage.read(key: 'token');
    var myId = await storage.read(key: 'myId');
    int id = singleRiskData['id'];
    var url = Uri.parse('${Constants().baseUrl}/api/riskrating');
    
     var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };
  
   var body = {
      'risk_id': id.toString(),
      'added_by': myId.toString(),
      'likelihood': likelihood.toString(),
      'impact':  impact.toString()
  };
      http.Response response;
      response = await http.post(url,body:body, headers:headers);

        if(response.statusCode == 200){
          var data = await jsonDecode(response.body);
          riskRatingController.sink.add(data);
          Navigator.pop(c);
          return data;
        }
    else{
       var data = jsonDecode(response.body);
       Navigator.pop(c);
       return data;
 
    }
       
  }


  Future editRiskExposure(c,riskImpact,riskExposure) async{
    Constants().showDialogMethod(c,"Processing, Please wait...");
    var token = await storage.read(key: 'token');
    var myId = await storage.read(key: 'myId');
    int id = singleRiskData['id'];
    var url = Uri.parse('${Constants().baseUrl}/api/riskexposure');

     var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };
  
   var body = {
      'risk_id': id.toString(),
      'added_by': myId.toString(),
      'risk_impact': riskImpact.toString(),
      'risk_exposure':  riskExposure.toString()
  };
      http.Response response;
      response = await http.post(url,body:body, headers:headers);

        if(response.statusCode == 200){
          var data = jsonDecode(response.body);
          riskRatingController.sink.add(data);
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