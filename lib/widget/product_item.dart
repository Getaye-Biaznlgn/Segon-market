import 'package:flutter/material.dart';
import 'package:flutter_segon/provider/cart.dart';
import 'package:flutter_segon/screen/product_detail.dart';
import 'package:provider/provider.dart';
import '../model/product.dart';
class ProductItem extends StatelessWidget {
  // String name;
  // String id;
  // String imgUrl;

  // ProductItem({
  //  @required this.name,
  //  @required this.id,
  //  @required this.imgUrl
  // }
  // );
  @override
  Widget build(BuildContext context) {
    Cart cart=Provider.of<Cart>(context);
    return Consumer<Product>(
      builder: (context, product, child)=>
       GestureDetector(
         onTap: (){
           Navigator.pushNamed(context, ProductDetail.productDetailRoute,arguments: product);
         },
         child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: GridTile(
              child:
              // Image(image: AssetImage('assets/images/orange.jpg'),fit: BoxFit.cover,),
              Image.network(product.imgUrl, fit: BoxFit.cover,),
            footer: GridTileBar(
              backgroundColor: Colors.black54,
              leading: IconButton(
                icon: Icon(product.isFavorite? Icons.favorite:Icons.favorite_border, color: Theme.of(context).accentColor,),
                onPressed: (){
                  product.toggleFavorite();
                },
              ),
              title: Text(product.name, overflow: TextOverflow.visible, textAlign: TextAlign.start,),
              trailing: IconButton(
                icon: Icon(Icons.shopping_cart, color: Theme.of(context).accentColor,),
                onPressed: (){
                  cart.addItem(product.id, product.name, product.price,  product.imgUrl, qty:1);
                },
              ),
            ),

          ),
         ),
       ),
    );
  }
}
