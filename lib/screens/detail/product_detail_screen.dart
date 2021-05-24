import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/overview/components/badge.dart';

import '../cart/cart_screen.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.transparent,
                  height: 450,
                  width: double.infinity,
                  child: Hero(
                    tag: loadedProduct.id,
                    child: Image.network(
                      loadedProduct.imageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                  child: Row(
                    children: [
                      CircularIcon(
                        child: IconButton(
                          constraints:
                              BoxConstraints(minHeight: 40, minWidth: 40),
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.navigate_before,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Spacer(),
                      Consumer<Cart>(
                        builder: (_, cart, ch) {
                          return Badge(
                            child: ch,
                            value: cart.itemCount.toString(),
                          );
                        },
                        child: CircularIcon(
                          child: IconButton(
                            constraints:
                                BoxConstraints(minHeight: 40, minWidth: 40),
                            icon: Icon(Icons.shopping_cart),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(CartScreen.routeName);
                            },
                          ),
                        ),
                      ),
                      CircularIcon(
                        child: IconButton(
                          constraints:
                              BoxConstraints(minHeight: 40, minWidth: 40),
                          icon: Icon(Icons.notifications),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
              ],
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

class CircularIcon extends StatelessWidget {
  final Widget child;
  const CircularIcon({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.black38,
        shape: BoxShape.circle,
      ),
      child: child,
    );
  }
}
