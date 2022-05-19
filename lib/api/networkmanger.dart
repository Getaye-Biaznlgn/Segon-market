import 'package:flutter_segon/api/api_error.dart';
import 'package:flutter_segon/api/api_response.dart';
import 'package:flutter_segon/model/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class NetworkManager{
  String baseUrl="";
  Future<ApiResponse> userAuthentication(String userName, String password) async{
    ApiResponse apiResponse= ApiResponse();
       http.Response response=await http.post(baseUrl,body: {
         'username': userName,
         'password': password
       }, headers: <String, String>{
         'content-type':'application/json; charset=UTF-8',
       });

       switch(response.statusCode){
         case 200:
           apiResponse.login=Login.fromJson(json.decode(response.body));
           break;
         case 401:
           apiResponse.error=ApiError.fromJson(json.decode(response.body));
           break;
         default:
           apiResponse.error=ApiError(error:'Something goes wrong');
       }
  }
}