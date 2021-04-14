import 'package:flutter/material.dart';
import 'package:shop_app/widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order'),
      ),
      body: Column(
        children: [
          Container(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return OrderItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}
