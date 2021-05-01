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
    return Scaffold(
      appBar: AppBarPop(title: 'Order'),
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
        builder: (context, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (dataSnapshot.error != null) {
              return Center(
                child: Text('Error'),
              );
            } else {
              return Column(
                children: [
                  Expanded(
                    child: Consumer<Orders>(
                        builder: (BuildContext context, orders, Widget? child) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              OrderItem(
                                orderItem: orders.order[index],
                                id: orders.order[index].id,
                                dateTime: orders.order[index].dateTime,
                                amount: orders.order[index].amount,
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
                      );
                    }),
                  ),
                ],
              );
            }
          }
        },
      ),
    );
  }
}
