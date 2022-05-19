import 'package:flutter/cupertino.dart';
import 'package:flutter_segon/model/cart_item.dart';

class Cart with ChangeNotifier{
  Map<String, CartItem> _cartItems={};

  Map<String, CartItem> get cartItems{
    return {..._cartItems};
  }
  int get getItemCount{
    int total=0;
    _cartItems.forEach((productId, cartItem) {
       total+=cartItem.qty;
    });
    return total;
}
 void removeCartItem(String productId){
    _cartItems.remove(productId);
    notifyListeners();
 }
 double get getTotalPrice{
    double total=0;
   _cartItems.forEach((productId, cartItem) {
     total+=cartItem.price * cartItem.qty;
   });
   return total;
 }
  void addItem(String productId,String name, double price , String imgUrl,{int qty=1}){
       if(_cartItems.containsKey(productId)){
         _cartItems.update(productId, (existingItem) =>
             CartItem(cartId: existingItem.cartId,
                     title: existingItem.title,
                     imgUrl: existingItem.imgUrl,
                  price: existingItem.price,
                qty: qty)
         );
       }
       else{
         _cartItems.putIfAbsent(productId, () => CartItem(
             cartId: DateTime.now().toString(),
             title: name,
             price: price,
             qty: qty,
             imgUrl: imgUrl));
       }
      notifyListeners();
       // print('cart item is added');
  }

  void removeAll(){
    _cartItems={};
    notifyListeners();
  }
}