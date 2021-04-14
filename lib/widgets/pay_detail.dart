import 'package:flutter/material.dart';
import 'package:shop_app/providers/cart.dart';

class PayDetail extends StatelessWidget {
  final Cart? cart;
  const PayDetail({Key? key, required this.cart}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Text(
                'Total Price:',
                style: TextStyle(fontSize: 15),
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
