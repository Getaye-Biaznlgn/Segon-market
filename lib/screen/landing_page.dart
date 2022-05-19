import 'package:flutter/material.dart';
import 'package:flutter_segon/screen/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
class LandingPage extends StatefulWidget{
  static String landingRoute='/landingPage';
  @override
  _LandingPageState createState() => _LandingPageState();
}
 class _LandingPageState extends State<LandingPage> {
  checkUserSession() async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    String userId=preferences.getString('userId');
    if(userId == null)
      Navigator.pushNamedAndRemoveUntil(context, LoginPage.routeName, ModalRoute.withName('/'));
    else
      Navigator.pushNamedAndRemoveUntil(context, Home.homeRoute, ModalRoute.withName('/'));
  }
  @override
  void initState() async {
    super.initState();
   checkUserSession();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
