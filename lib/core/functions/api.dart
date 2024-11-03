import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/constant/link.dart';
import 'package:e_commerce_app/core/errors/fialures.dart';

import 'package:e_commerce_app/data/model/auth/usermodel/user/user.dart';
import 'package:http/http.dart' as http;
class Api {
Future  postRequest(String url, Map<String, dynamic> data) async {
  
    try {
  var response = await http.post(
    Uri.parse(url),
    body: data,
    
  );
   
      if(response.statusCode == 200 ||response.statusCode == 201){
        var jsonData = jsonDecode(response.body);
       
   return jsonData;
      }else{
        throw "error in this code ";
      }
  
    
} on Exception catch (e) {
  print(e);
  return [];
  

}
    
 

   
    
  }


  Future  getRequiest(String url, ) async {
  
    try {
  var response = await http.post(
    Uri.parse(url),
  );
   
      if(response.statusCode == 200 ||response.statusCode == 201){
        var jsonData = jsonDecode(response.body);
       
   return jsonData;
      }else{
        throw "error in this code ";
      }
  
    
} on Exception catch (e) {
  print(e);
  return [];
  

}
    
 

   
    
  }
}


