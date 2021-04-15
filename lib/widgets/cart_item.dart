import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart' as Cart;
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/widgets/item_detail.dart';

import 'container_border.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgUrl;
  final int quantity;
  final double price;
  final Function changeQuantity;
  final bool isSelected;
  CartItem({
    required this.isSelected,
    required this.id,
    required this.title,
    required this.imgUrl,
    required this.quantity,
    required this.price,
    required this.changeQuantity,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      height: 100,
      width: 100,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final order = Provider.of<OrderItem>(context);
          return Row(
            children: [
              Consumer<Cart.Cart>(
                builder: (ctx, cart, ch) {
                  return Checkbox(
                    value: isSelected,
                    onChanged: (value) {
                      cart.toggleSelected(id);

                      order.add(Cart.CartItem(
                        title: title,
                        id: id,
                        imgUrl: imgUrl,
                        price: price,
                        quantity: quantity,
                      ));
                    },
                  );
                },
              ),
              Container(
                height: constraints.maxHeight,
                width: constraints.maxHeight,
                child: Image.network(imgUrl),
              ),
              ItemDetail(
                title: title,
                price: price,
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
                    changeQuantity(id, 0, context);
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
                  quantity.toString(),
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
                    changeQuantity(id, 1, context);
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
