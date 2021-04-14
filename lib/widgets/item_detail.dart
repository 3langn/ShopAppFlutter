import 'package:flutter/material.dart';
import 'package:shop_app/constants/constants.dart';

class ItemDetail extends StatelessWidget {
  final String? title;
  final double? price;
  final bool? showSale;
  ItemDetail({this.price, this.title, this.showSale = true});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title!),
        Row(
          children: [
            showSale!
                ? Text(
                    'đ${(price! * 1.2).toStringAsFixed(3)}',
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  )
                : Container(),
            SizedBox(width: 5),
            Text(
              'đ${price!.toStringAsFixed(3)}',
              style: kPriceTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}
