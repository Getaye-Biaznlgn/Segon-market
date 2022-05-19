import 'package:flutter/cupertino.dart';
import 'package:flutter_segon/model/cart_item.dart';
import 'package:flutter_segon/model/order_item.dart';

class Orders with ChangeNotifier{
  List<OrderItem> _orders=[];

  List<OrderItem> get orders{
    return [..._orders];
  }

  void addOrderItem(List<CartItem> cartItem, double totalPrice){
    _orders.insert(0, OrderItem(id:DateTime.now().toString(),
                 date: DateTime.now(),
                items: cartItem,
                 totalCost: totalPrice
              ));
    notifyListeners();
  }
}