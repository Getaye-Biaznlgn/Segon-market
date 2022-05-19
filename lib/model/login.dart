class Login{
  String userName;
  String password;
  String userId;
  Login({this.userName, this.password, this.userId});

 factory Login.fromJson(Map<String, dynamic> data){
   return Login(
     userName: data['username'],
     password:data['password'],
     userId: data['userId']
   );
 }
}