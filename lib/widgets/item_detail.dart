import 'package:flutter/material.dart';
import 'package:shop_app/constants/constants.dart';

class ItemDetail extends StatelessWidget {
  final String? title;
  final double? price;
  final bool? showSale;
  ItemDetail({this.price, this.title, this.showSale});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title!),
        Row(
          children: [
            Text(
              'đ${price! * 1.2}',
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              ),
            ),
            SizedBox(width: 5),
            Text(
              'đ$price',
              style: kPriceTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}
