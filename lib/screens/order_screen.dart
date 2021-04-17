import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders.dart' show Orders;
import 'package:shop_app/widgets/appbar_navigate_before.dart';
import 'package:shop_app/widgets/order_item.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = 'order_screen';

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    print('Order Screen build');
    final orders = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBarPop(title: 'Order'),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    OrderItem(
                      orderItem: orders.order[index],
                      id: DateTime.now().toString(),
                      dateTime: DateTime.now(),
                    ),
                    Divider(
                      height: 0.2,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10)
                  ],
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
