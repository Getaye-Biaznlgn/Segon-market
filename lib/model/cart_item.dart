import 'package:flutter/foundation.dart';
class CartItem{
  String cartId;
  String title;
  double price;
  String imgUrl;
  int qty;
  CartItem({
           @required this.cartId,
           @required this.title,
           @required this.price,
           @required this.qty,
           @required this.imgUrl,
           });
}