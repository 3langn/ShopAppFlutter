import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 180,
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\đ ${product.price.toStringAsFixed(3)}',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        Text('9 Sale', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_sharp,
                                  color: Colors.grey,
                                  size: 16,
                                ),
                                Text(
                                  'Ho Chi Minh',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_border_outlined,
                                  size: 15,
                                  color: Colors.yellow,
                                ),
                                Icon(
                                  Icons.star_border,
                                  size: 15,
                                  color: Colors.yellow,
                                ),
                                Icon(
                                  Icons.star_border,
                                  size: 15,
                                  color: Colors.yellow,
                                ),
                                Icon(
                                  Icons.star_border,
                                  size: 15,
                                  color: Colors.yellow,
                                ),
                                Icon(
                                  Icons.star_border,
                                  size: 15,
                                  color: Colors.yellow,
                                ),
                                Text('(9)'),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          iconSize: 30,
                          icon: Icon(
                            Icons.shopping_cart,
                          ),
                          onPressed: () {
                            cart.addItem(
                              product.id,
                              product.title,
                              product.imageUrl,
                              product.price,
                            );
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Added item to cart !'),
                                  duration: Duration(seconds: 2),
                                  action: SnackBarAction(
                                    label: 'UNDO',
                                    onPressed: () {
                                      cart.removeSingleItem(product.id);
                                    },
                                  )),
                            );
                          },
                          color: Theme.of(context).accentColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
