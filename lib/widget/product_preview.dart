import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_segon/model/product.dart';
import 'package:flutter_segon/provider/product_list.dart';
import 'package:flutter_segon/widget/product_item.dart';
import 'package:provider/provider.dart';
class ProductPreview extends StatelessWidget {
  bool showFavorite;
  ProductPreview({@required this.showFavorite});
  @override
  Widget build(BuildContext context) {
    final orientation=MediaQuery.of(context).orientation;

    ProductList productList= Provider.of<ProductList>(context);
    List<Product> itemList=showFavorite? productList.favoriteList: productList.produtList;
    return GridView.builder(
      padding: EdgeInsets.only(top:5.0),
      itemCount: itemList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (orientation==Orientation.portrait)?2:3,
            mainAxisSpacing: 10,
            crossAxisSpacing:10,
            childAspectRatio: 3/2,
        ),
        itemBuilder: (ctx, index)=>ChangeNotifierProvider.value(
          value: itemList[index],
          child: ProductItem(),
        )
    );
  }
}
