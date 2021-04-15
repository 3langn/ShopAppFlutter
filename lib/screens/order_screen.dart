import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders.dart' show Orders;
import 'package:shop_app/widgets/appbar_navigate_before.dart';
import 'package:shop_app/widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = 'order_screen';
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBarPop(title: 'Order'),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 200,
            width: double.infinity,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return OrderItem(
                  orderItem: orders.order[index],
                  id: DateTime.now().toString(),
                  dateTime: DateTime.now(),
                );
              },
              itemCount: orders.order.length,
            ),
          ),
        ],
      ),
    );
  }
}
