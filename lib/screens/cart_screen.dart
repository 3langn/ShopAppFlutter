import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart' show Cart;
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/screens/order_screen.dart';
import 'package:shop_app/widgets/appbar_navigate_before.dart';
import 'package:shop_app/widgets/cart_item.dart';
import 'package:shop_app/widgets/pay_detail.dart';

const double kToolbarHeight = 56.0;

class CartScreen extends StatelessWidget {
  static const routeName = 'cart_screen';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final appbar = AppBarPop(title: 'Cart');
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
                    isSelected: cart.items.values.toList()[index].isSelected,
                    id: cart.items.values.toList()[index].id,
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
              color: Colors.grey[300],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildCheckBoxAll(),
                  PayDetail(cart: cart),
                  buildTextButtonBuy(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextButton buildTextButtonBuy(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    final orderItem = Provider.of<OrderItem>(context);
    return TextButton(
      onPressed: () {
        print("In orderItem");
        print(orderItem);
        print(orderItem.id);
        orders.addOrder(orderItem);
        print(orders.order[0].products![0].title);
        Navigator.of(context).pushNamed(OrderScreen.routeName);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            return Theme.of(context).accentColor;
          },
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: MediaQuery.of(context).size.width * 1 / 3,
        child: Text(
          'Buy (0)',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Row buildCheckBoxAll() {
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (value) {},
        ),
        Text('All'),
      ],
    );
  }
}
