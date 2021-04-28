import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/widgets/user_product_item.dart';

import 'edit_product_screen.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = 'user_product_screen';
  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Product',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                EditProductScreen.routeName,
              );
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Consumer<Products>(
            builder: (BuildContext context, value, Widget? child) {
              return ListView.builder(
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      UserProductItem(
                        id: productsData.items![i].id,
                        title: productsData.items![i].title,
                        imageUrl: productsData.items![i].imageUrl,
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: productsData.items!.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
