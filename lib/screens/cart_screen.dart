import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart' show Cart;
import 'package:shop_app/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'cart_screen';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final appbar = AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.navigate_before,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Text(
        'Cart',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
    return Scaffold(
      appBar: appbar,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.92 -
                  MediaQuery.of(context).viewPadding.top -
                  0.5 -
                  appbar.preferredSize.height,
              color: Colors.white,
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return CartItem(
                    title: cart.items.values.toList()[index].title,
                    imgUrl: cart.items.values.toList()[index].imgUrl,
                    quantity: cart.items.values.toList()[index].quantity,
                    price: cart.items.values.toList()[index].price,
                    changeQuantity: cart.changeQuantity,
                  );
                },
                itemCount: cart.items.length,
              ),
            ),
            Divider(
              height: 0.5,
              color: Colors.grey,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.check_box_outline_blank,
                      size: 30,
                    ),
                  ),
                  Text('All'),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Total Price:',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              ' ${cart.totalPrice}đ',
                              style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        Text(
                          'Receive 0đ',
                          style: TextStyle(
                            color: Colors.amber,
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      width: 150,
                      height: double.infinity,
                      color: Theme.of(context).accentColor,
                      child: Text(
                        'Buy (0)',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
