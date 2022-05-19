class ApiError{
  String error;
 ApiError({this.error});

 factory ApiError.fromJson(Map<String, dynamic> errorJson){
    return ApiError(error: errorJson['error']);
 }
}