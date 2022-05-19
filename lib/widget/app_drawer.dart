import 'package:flutter/material.dart';
import 'package:flutter_segon/screen/ordes_page.dart';
import 'package:flutter_segon/screen/cart_page.dart';
class AppDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
       child: Column(
         children: [
           AppBar(title: Text('ሰጎን ገበያ'),
           automaticallyImplyLeading: false,
           ),
           ListTile(
             leading: Icon(Icons.shopping_bag),
             title: Text('Shop'),
             onTap: (){
               Navigator.of(context).pushReplacementNamed('/');
             },
           ),
           Divider(),
           ListTile(
             leading: Icon(Icons.payment),
             title: Text('Orders'),
             onTap: (){
               Navigator.of(context).pushNamed(OrdersPage.ordersRoute);
             },
           ),
           Divider(),
           ListTile(
             leading: Icon(Icons.shopping_cart),
             title: Text('Cart'),
             onTap: (){
               Navigator.of(context).pushNamed(CartPage.cartRoute);
             },
           ),
           Divider()
         ],
       ),
    );
  }
}
