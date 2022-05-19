import 'package:flutter/material.dart';
import 'package:flutter_segon/model/order_item.dart';
import 'package:intl/intl.dart';

class OrdersItem extends StatelessWidget {
  OrderItem orderItem;
  OrdersItem({@required this.orderItem});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: ListTile(
          leading: Text(DateFormat('dd/ MM/ yyyy hh:mm').format(orderItem.date)),
          title: Text('Total Cost'),
          subtitle: Text('\$${orderItem.totalCost.toString()}'),
        ),
        children: orderItem.items.map((cartItem) =>Card(
          child: ListTile(
            leading: Image.network(cartItem.imgUrl, fit: BoxFit.cover, width: 100,),
            title: Text(cartItem.title),
            subtitle: Text(cartItem.price.toString()),
            trailing: Text(cartItem.qty.toString()),
          ),
        )).toList(),
      ),
    );
  }
}
