import 'package:flutter/material.dart';
import 'package:flutter_segon/model/product.dart';
import 'package:flutter_segon/provider/cart.dart';
import 'package:flutter_segon/widget/round_icon_button.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductDetail extends StatefulWidget {
  static String productDetailRoute='/detailRoute';

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final _scaffoldKey=GlobalKey<ScaffoldState>();
  int qty=1;
  void _notifyUsers(){
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(content:
      Text('ወዳጄ! ወደ ዘንቢልዎ ተጨምሯል\n እንባክዎ  ወደ ዘንቢልዎ ገብተው ያዝዙ', textAlign: TextAlign.center,),
      padding:EdgeInsets.all(10.0) ,
      ),);
  }

  @override
  Widget build(BuildContext context) {

   var product= ModalRoute.of(context).settings.arguments as Product;
   String name=product.name;
   String description=product.description;
   String imgUrl=product.imgUrl;
   double price=product.price;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(name),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Image.network(imgUrl, fit: BoxFit.cover,),
            SizedBox(height: 10,),
            Text('\$${price.toString()}',
              style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 20.0),
            textAlign: TextAlign.center,),
            SizedBox(height: 10,),
            Text(description,
              textAlign: TextAlign.center,
             style: TextStyle(
               fontSize: 16.0
             ),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundIconButton(iconData: FontAwesomeIcons.minus,
                    onPressed: (){
                  setState(() {
                    if(qty<=1)
                      qty=1;
                    else{
                      qty--;
                    }
                  });
                    }),
              SizedBox(width: 10,),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).accentColor,
                   width: 2, style: BorderStyle.solid)
                ),
                child: Column(
                  children: [
                    Text('Qty', style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(qty.toString(), style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0
                    ),),
                  ],
                ),
              ),
                SizedBox(width: 10,),
                RoundIconButton(
                    iconData: FontAwesomeIcons.plus,
                    onPressed: (){
                  setState(() {
                    qty++;
                    // print('u have pressed plus');
                  });

                    })
            ],),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0),
              child: RaisedButton(
                 padding: EdgeInsets.all(10),
                 child: Text('ዘንቢልዎ ላይ ይጨምሩ', style: TextStyle(
                   fontWeight: FontWeight.bold,
                   color: Colors.white,
                   fontSize: 20.0
                 ),),
                  color: Theme.of(context).accentColor,
                  onPressed: (){
                   Provider.of<Cart>(context, listen: false).addItem(product.id, product.name, product.price, product.imgUrl,qty: qty);
                   _notifyUsers();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
