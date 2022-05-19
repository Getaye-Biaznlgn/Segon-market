import 'package:flutter/material.dart';
import 'package:flutter_segon/model/cart_item.dart';
import 'package:flutter_segon/provider/Orders.dart';
import 'package:flutter_segon/provider/cart.dart';
import 'package:flutter_segon/widget/cart_item_page.dart';
import 'package:provider/provider.dart';
class CartPage extends StatelessWidget {
      static String cartRoute='/cartpage';
      final _scaffoldKey=GlobalKey<ScaffoldState>();
      void _notifyUsers(){
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(content:
          Text('እናመሰግናለን ትዛዝዎ ተሳክቷል!\t Welcome back', textAlign: TextAlign.center,),
            padding:EdgeInsets.all(10.0) ,
          ),);
      }
  @override
  Widget build(BuildContext context) {
    Cart cart=Provider.of<Cart>(context);
    List<CartItem> cartList=cart.cartItems.values.toList();
    // List<String> keys= cart.cartItems.keys;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('ዘንቢልዎ'),
      ),
      body: Container(
        child:
          Column(
            children: <Widget>[
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Total\t ${cart.getItemCount}'),
                      Spacer(),
                      Text('\$${cart.getTotalPrice}'),
                      SizedBox(
                        width: 10,
                      ),
                      FlatButton(
                             child: Text('አሁን ይዘዙ',
                             style: TextStyle(fontWeight: FontWeight.bold),),
                             color: Theme.of(context).accentColor,

                             textColor: Colors.white,
                             onPressed: (){
                               Provider.of<Orders>(context, listen: false).addOrderItem(cartList, cart.getTotalPrice);
                               cart.removeAll();
                                _notifyUsers();
                             },
                           ),
                    ],

                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: cart.cartItems.length,
                    itemBuilder: (ctx, index)=>Dismissible(
                      child: CartItemPage(
                          title: cartList[index].title,
                          imageUrl: cartList[index].imgUrl,
                          price: cartList[index].price,
                          qty:cartList[index].qty
                      ),
                      background: Container(
                        alignment: Alignment.centerRight,
                        color: Colors.red,
                        child: Icon(Icons.delete, color: Colors.white,),
                      ),
                      key: ValueKey(cart.cartItems.keys.toList()[index]),
                      onDismissed: (direction){
                        cart.removeCartItem(cart.cartItems.keys.toList()[index]);
                      },
                    )
                ),
              )
            ],
          ),
        ),

    );
  }
}

