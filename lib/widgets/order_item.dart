import 'package:flutter/material.dart';
import 'package:shop_app/providers/orders.dart' as pOrder;
import 'package:shop_app/widgets/item_detail.dart';

class OrderItem extends StatelessWidget {
  final pOrder.OrderItem orderItem;
  final String id;
  final DateTime dateTime;
  OrderItem({
    required this.orderItem,
    required this.id,
    required this.dateTime,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(orderItem.id!),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              return Container(
                padding: EdgeInsets.all(10),
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
                          child:
                              Image.network(orderItem.products![index].imgUrl),
                        ),
                        ItemDetail(
                          title: orderItem.products![index].title,
                          price: orderItem.products![index].price,
                          showTime: true,
                        ),
                        Spacer(),
                        Text('Đang vận chuyển ...'),
                      ],
                    );
                  },
                ),
              );
            },
            itemCount: orderItem.products!.length,
          ),
        )
      ],
    );
  }
}
