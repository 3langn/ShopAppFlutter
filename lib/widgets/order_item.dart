import 'package:flutter/material.dart';
import 'package:shop_app/constants/constants.dart';
import 'package:shop_app/providers/orders.dart' as pOrder;
import 'package:shop_app/widgets/product_detail.dart';

class OrderItem extends StatelessWidget {
  final pOrder.OrderItem? orderItem;
  final String? id;
  final DateTime? dateTime;
  final double? amount;
  OrderItem({
    required this.amount,
    required this.id,
    required this.dateTime,
    required this.orderItem,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              return Container(
                padding: EdgeInsets.only(bottom: 10),
                color: Colors.white,
                alignment: Alignment.center,
                height: 100,
                width: 100,
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Row(
                      children: [
                        Container(
                          height: constraints.maxHeight,
                          width: constraints.maxHeight,
                          child: Image.network(
                              orderItem!.products![index].imgUrl!),
                        ),
                        SizedBox(width: 10),
                        ProductDetail(
                          showQuantity: true,
                          quantity: orderItem!.products![index].quantity,
                          title: orderItem!.products![index].title,
                          price: orderItem!.products![index].price,
                          dateTime: dateTime,
                        ),
                      ],
                    );
                  },
                ),
              );
            },
            itemCount: orderItem!.products!.length,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Total : '),
              SizedBox(width: 20),
              Text(
                '${orderItem!.amount!.toStringAsFixed(3)} đ',
                style: kPriceTextStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
