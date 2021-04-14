import 'package:flutter/material.dart';
import 'package:shop_app/providers/cart.dart';

class BuyBar extends StatelessWidget {
  final Cart? cart;
  const BuyBar({Key? key, this.cart}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Total Price:',
                style: TextStyle(fontSize: 18),
              ),
              FittedBox(
                child: Text(
                  ' ${cart!.totalPrice.toStringAsFixed(3)}đ',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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
    );
  }
}
