import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final productsData= Provider.of(Products)(context);
    return Consumer<Products>(
      builder: (BuildContext context, productsData, Widget child) {
        final products = productsData.item;
        return GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return ProductItem(
              products[index].id,
              products[index].title,
              products[index].imageUrl,
            );
          },
        );
      },
    );
  }
}
