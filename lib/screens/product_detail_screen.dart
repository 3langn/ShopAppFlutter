import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)!.settings.arguments as String?; // is the id!
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.navigate_before_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          loadedProduct.title,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(loadedProduct.imageUrl),
          ),
          Text(
            loadedProduct.title + loadedProduct.description,
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
          Text(loadedProduct.price.toString()),
        ],
      ),
    );
  }
}
