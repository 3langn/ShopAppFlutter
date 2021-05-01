import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFav;
  final String? search;
  ProductsGrid(this.showFav, this.search);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = search == null
        ? productsData.items
        : productsData.searchProduct(search);
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products!.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
