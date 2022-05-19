import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier{
  String id;
  String name;
  String description;
  double price;
  String imgUrl;
  bool isFavorite;
  Product({
    @required this.id,
    @required this.name,
    @required this.price,
    @required this.description,
    @required this.imgUrl,
    this.isFavorite=false,
  });

   void toggleFavorite(){
     isFavorite=!isFavorite;
     notifyListeners();
   }
}