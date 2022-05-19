import 'package:flutter_segon/model/cart_item.dart';

class OrderItem{
  String id;
  double totalCost;
  List<CartItem> items;
  DateTime date;

  OrderItem({this.id,
            this.totalCost,
            this.items,
            this.date});
}

