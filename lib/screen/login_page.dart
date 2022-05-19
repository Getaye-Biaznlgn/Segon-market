import'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginPage extends StatefulWidget{
  static String routeName= "/loginroute";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  final  _formKey= GlobalKey<FormState>();
  String userName;
  String password;

  void saveForm() async{
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      SharedPreferences preferences=await SharedPreferences.getInstance();
      preferences.setString('userId', 'getayie');
      Navigator.pushNamedAndRemoveUntil(context, '/',ModalRoute.withName('/'));

    }
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
          child: Form(
            key: _formKey,
            child: Column(children:<Widget> [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(width: 1, color: Colors.blueAccent,style: BorderStyle.solid)
                  ),

                ),
                validator: (value){
                  if(value.isEmpty)
                    return "Please enter user name";
                  return null;
                },
                onSaved: (value){
                  this.userName=value;
                },
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(width: 1, color: Colors.blueAccent,style: BorderStyle.solid)
                  ),
                ),
                validator: (value){
                  if(value.isEmpty)
                    return "Please enter user name";
                  return null;
                },
                onSaved: (value){
                  this.password=value;
                },
              ),
              RaisedButton(
                child: Text("Login"),
                  onPressed: (){
                  Fluttertoast.showToast(msg: "Don't kick me, it's my right to say...");
                   saveForm();
                 })
        ],
            ),
          ),),
      );
  }
}