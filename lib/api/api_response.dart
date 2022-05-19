import 'package:flutter_segon/api/api_error.dart';
import 'package:flutter_segon/model/login.dart';
class ApiResponse{
     ApiError _apiError;
     Login _login;

     ApiError get error => _apiError;

  set error(ApiError value) {
    _apiError = value;
  }

     Login get login => _login;

  set login(Login value) {
    _login = value;
  }
}