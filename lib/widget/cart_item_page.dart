import 'package:flutter/material.dart';
class CartItemPage extends StatelessWidget {
   String title;
   String imageUrl;
   double price;
   int qty;
   CartItemPage({
     @required this.title,
     @required this.imageUrl,
     @required this.price,
     @required this.qty,
});

  @override
  Widget build(BuildContext context) {
    return Card(
        child:Tooltip(
          message: 'Swipe to delete',
          showDuration: Duration(seconds: 2),
          child: ListTile(
            leading: Image.network(imageUrl, fit: BoxFit.cover,width: 100,),
            title: Text(title),
            subtitle: Text('\$${price.toString()}'),
            trailing: Text('Qty:\t${qty}'),

          ),
        )
    );
  }
}
