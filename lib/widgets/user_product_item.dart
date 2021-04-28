import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/user_product/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {
  final String? title;
  final String? imageUrl;
  final String? id;
  UserProductItem({
    required this.title,
    required this.imageUrl,
    required this.id,
  });
  @override
  Widget build(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    return ListTile(
      title: Text(title!),
      leading: Container(
        height: 100,
        width: 80,
        child: Image.network(imageUrl!),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  EditProductScreen.routeName,
                  arguments: id,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                try {
                  await Provider.of<Products>(context, listen: false)
                      .removeProduct(id);
                } catch (e) {
                  scaffold.showSnackBar(
                      SnackBar(content: Text('Deleting failed!')));
                  print(e);
                }
              },
              color: Theme.of(context).errorColor,
            )
          ],
        ),
      ),
    );
  }
}
