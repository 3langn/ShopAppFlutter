import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/search_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        title: Container(
          height: 40,
          child: GestureDetector(
            onTap: () =>
                Navigator.of(context).pushNamed(SearchScreen.routesName),
            child: TextField(
              enabled: false,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Color(0xFFF2F4F5),
                hintStyle: TextStyle(color: Colors.grey[600]),
                hintText: "What would your like to buy?",
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              height: 300,
              width: double.infinity,
              child: Hero(
                tag: loadedProduct.id,
                child: Image.network(
                  loadedProduct.imageUrl,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Text(
              loadedProduct.title,
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            Text(
              loadedProduct.description,
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            Text(loadedProduct.price.toString()),
            SizedBox(height: 800),
          ],
        ),
      ),
    );
  }
}
