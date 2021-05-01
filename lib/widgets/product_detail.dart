import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/constants/constants.dart';

class ProductDetail extends StatelessWidget {
  final String? title;
  final double? price;
  final int? quantity;
  final bool? showTime;
  final bool? showQuantity;
  final DateTime? dateTime;
  ProductDetail({
    required this.quantity,
    required this.dateTime,
    required this.title,
    required this.price,
    this.showTime = false,
    this.showQuantity = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'đ${(price! * 1.2).toStringAsFixed(3)}',
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 5),
              Text(
                '${price!.toStringAsFixed(3)}đ',
                style: kPriceTextStyle,
              ),
              Spacer(),
              showQuantity! ? Text('x$quantity') : Container(),
            ],
          ),
          showTime!
              ? Text(DateFormat('dd/MM/yyy - hh:mm').format(dateTime!))
              : Container(),
        ],
      ),
    );
  }
}
