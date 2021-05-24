import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart' show Cart, CartItemProvider;
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/screens/cart/cart_item.dart';
import 'package:shop_app/screens/order_screen.dart';
import 'package:shop_app/widgets/appbar_navigate_before.dart';
import 'package:shop_app/widgets/pay_detail.dart';

const double kToolbarHeight = 56.0;

class CartScreen extends StatelessWidget {
  static const routeName = 'cart_screen';
  @override
  Widget build(BuildContext context) {
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
              child: Consumer<Cart>(
                builder: (BuildContext context, cart, Widget? child) {
                  return ListView.builder(
                    itemBuilder: (ctx, index) {
                      return ChangeNotifierProvider.value(
                        value: CartItemProvider(
                          imgUrl: cart.items.values.toList()[index].imgUrl,
                          id: cart.items.values.toList()[index].id,
                          price: cart.items.values.toList()[index].price,
                          quantity: cart.items.values.toList()[index].quantity,
                          title: cart.items.values.toList()[index].title,
                        ),
                        child: CartItem(),
                      );
                    },
                    itemCount: cart.items.length,
                    shrinkWrap: true,
                  );
                },
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
                  PayDetail(),
                  TextButtonBuy(),
                ],
              ),
            ),
          ],
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

class TextButtonBuy extends StatelessWidget {
  const TextButtonBuy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return TextButton(
      onPressed: () async {
        List<CartItemProvider> listCart =
            cart.items.values.where((element) => element.isSelected).toList();
        if (listCart.length == 0) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    content: Text('You didn\'t choice product to buy !'));
              });
        } else {
          EasyLoading.instance
            ..dismissOnTap = true
            ..textColor = Colors.black54
            ..displayDuration = const Duration(milliseconds: 2000)
            ..indicatorSize = 45.0
            ..loadingStyle = EasyLoadingStyle.custom
            ..backgroundColor = Colors.white38
            ..indicatorColor = Colors.black54;
          EasyLoading.show(
            status: 'loading...',
            indicator: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            ),
          );
          await Provider.of<Orders>(context, listen: false).addOrder(
            listCart,
          );
          EasyLoading.dismiss();
          cart.clear();
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed(OrderScreen.routeName);
        }
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
          'Buy (${cart.totalIsSelected})',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
