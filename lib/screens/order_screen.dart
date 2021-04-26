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
  var _isLoading = false;
  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    Future.delayed(Duration.zero).then((_) async {
      await Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
    });
    setState(() {
      _isLoading = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBarPop(title: 'Order'),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
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
            ),
          ),
        ],
      ),
    );
  }
}
