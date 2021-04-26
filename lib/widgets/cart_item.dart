import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/widgets/item_detail.dart';

import 'container_border.dart';

class CartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartItem = Provider.of<CartItemProvider>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      height: 100,
      width: 100,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Row(
            children: [
              Checkbox(
                value: cart.items['${cartItem.id}']!.isSelected,
                onChanged: (value) {
                  cart.toggleSelected(cartItem.id);
                },
              ),
              Container(
                height: constraints.maxHeight,
                width: constraints.maxHeight,
                child: Image.network(cartItem.imgUrl),
              ),
              SizedBox(width: 10),
              ProductDetail(
                quantity: cartItem.quantity,
                title: cartItem.title,
                price: cartItem.price,
                dateTime: DateTime.now(),
              ),
              Spacer(),
              ContainerBorder(
                height: constraints.maxWidth * 1 / 15,
                width: constraints.maxWidth * 1 / 15,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.remove,
                    size: constraints.maxWidth * 1 / 20,
                  ),
                  onPressed: () {
                    cart.changeQuantity(
                      cartItem.id,
                      0,
                      context,
                    );
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: constraints.maxWidth * 1 / 15,
                width: constraints.maxWidth * 1 / 10,
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                  ),
                ),
                child: Text(
                  cartItem.quantity.toString(),
                  style: TextStyle(
                    fontSize: constraints.maxWidth * 1 / 20,
                  ),
                ),
              ),
              ContainerBorder(
                width: constraints.maxWidth * 1 / 15,
                height: constraints.maxWidth * 1 / 15,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.add,
                    size: constraints.maxWidth * 1 / 20,
                  ),
                  onPressed: () {
                    cart.changeQuantity(
                      cartItem.id,
                      1,
                      context,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
