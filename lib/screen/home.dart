import 'package:flutter/material.dart';
import 'package:flutter_segon/provider/cart.dart';
import 'package:flutter_segon/screen/cart_page.dart';
import 'package:flutter_segon/widget/app_drawer.dart';
import 'package:flutter_segon/widget/badge.dart';
import 'package:flutter_segon/widget/product_preview.dart';
import 'package:provider/provider.dart';
enum FilterOption{
  Favorite,
  All
}

class Home extends StatefulWidget {
   static String homeRoute='/';
  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {
  bool showFavorite=false;
  @override
  Widget build(BuildContext context) {
    Cart cart=Provider.of<Cart>(context);

    return Scaffold(

      appBar: AppBar(
        title: Text('ሰጎን'),
        centerTitle: true,
        actions: <Widget>[
          Badge(child: IconButton(icon: Icon(Icons.shopping_cart),
              onPressed: (){
              Navigator.pushNamed(context, CartPage.cartRoute);
              }),
              value: cart.getItemCount.toString()),
          PopupMenuButton(
            icon:Icon(Icons.more_vert),
            onSelected: (FilterOption selected){
                     if(selected==FilterOption.Favorite) {
                       setState((){
                         showFavorite = true;
                       });
                       print('Favorite is pressed');
                     }
                     else{
                       setState((){
                         showFavorite = false;
                       });
                       print('All is pressed');
                     }
          },
          itemBuilder: (_)=>[
            PopupMenuItem(
                child: Text("All"),
               value: FilterOption.All,
            ),
            PopupMenuItem(
              child: Text("Favorites"),
              value: FilterOption.Favorite,
            )
     ],
      ),
      ],
      ),
      drawer: AppDrawer(),
      body: ProductPreview( showFavorite:showFavorite),
    );
  }
}
