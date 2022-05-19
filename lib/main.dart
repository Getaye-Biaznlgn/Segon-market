import 'package:flutter/material.dart';
import 'package:flutter_segon/model/login.dart';
import 'package:flutter_segon/provider/Orders.dart';
import 'package:flutter_segon/screen/landing_page.dart';
import 'package:flutter_segon/screen/login_page.dart';
import 'package:flutter_segon/screen/ordes_page.dart';
import 'package:flutter_segon/screen/product_detail.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './provider/product_list.dart';
import './screen/home.dart';
import './provider/cart.dart';
import './screen/cart_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)  {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(
        create: (context)=>ProductList(),
        ),
          ChangeNotifierProvider(
            create: (context)=>Cart(),
          ),
          ChangeNotifierProvider(
              create:(cxt)=> Orders()
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: Colors.purple,
            accentColor: Colors.purpleAccent,
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          // home: Home(),
          initialRoute: LandingPage.landingRoute ,
          routes: {
            LoginPage.routeName: (cxt) => LoginPage(),
            Home.homeRoute: (cxt) => Home(),
            CartPage.cartRoute:(cxt)=>CartPage(),
            ProductDetail.productDetailRoute:(cxt)=>ProductDetail(),
            OrdersPage.ordersRoute:(cxt)=> OrdersPage(),
            LandingPage.landingRoute:(cxt)=> LandingPage()
          },
        ),

    );
  }
}
