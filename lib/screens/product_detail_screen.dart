import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routesName = 'product_detail_screen';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('a'),
      ),
    );
  }
}
