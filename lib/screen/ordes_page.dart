import 'package:flutter/material.dart';
import 'package:flutter_segon/provider/Orders.dart';
import 'package:flutter_segon/widget/orders_item.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatelessWidget {
  static String ordersRoute='/ordersRoute';
  @override
  Widget build(BuildContext context) {
   Orders orders= Provider.of<Orders>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('ትዕዝዛዎ'),
        // automaticallyImplyLeading: true,
      ),
      body: ListView.builder(
         itemCount: orders.orders.length,
          itemBuilder:(cxt,index)=>OrdersItem(orderItem: orders.orders[index],
          )),
    );
  }
}
