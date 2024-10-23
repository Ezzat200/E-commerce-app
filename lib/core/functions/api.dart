import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/errors/fialures.dart';
import 'package:http/http.dart' as http;

String _basicAuth = 'Basic ' +
    base64Encode(utf8.encode(
        'ezzat:ezzat12345'));
  
    Map<String, String> myheaders = {
          'authorization': _basicAuth
    };


    class Api{

    Future  <Either<ServerFailure,Map>>postRequest(String url,Map data) async{
     try {
      var response = await http.post(Uri.parse(url),body: data);
    
        Map responsebody = jsonDecode(response.body);
        return right(responsebody);
      
      
     } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e)) ;
      }
              return left(ServerFailure(e.toString())) ;

     } 
      } 
    }

