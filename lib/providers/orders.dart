import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/providers/cart.dart';

class OrderItem {
  final List<CartItemProvider>? products;
  final String? id;
  final double? amount;
  final DateTime? dateTime;
  OrderItem({
    required this.id,
    required this.amount,
    required this.dateTime,
    required this.products,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _order = [];
  List<OrderItem> get order {
    return [..._order];
  }

  Future<void> fetchAndSetOrders() async {
    final url =
        Uri.parse('https://shop-36394-default-rtdb.firebaseio.com/orders.json');
    final response = await http.get(url);
    final List<OrderItem> loadedOrders = [];
    final extractedData = jsonDecode(response.body) as Map<String, dynamic>?;
    if (extractedData == null) return;
    extractedData.forEach((orderId, orderData) {
      loadedOrders.add(
        OrderItem(
          id: orderId,
          amount: orderData['amount'],
          dateTime: DateTime.parse(orderData['dateTime']),
          products: (orderData['products'] as List<dynamic>)
              .map(
                (item) => CartItemProvider(
                  title: item['title'],
                  id: item['id'],
                  imgUrl: item['imageUrl'],
                  price: item['price'],
                  quantity: item['quantity'],
                ),
              )
              .toList(),
        ),
      );
      _order = loadedOrders;
      notifyListeners();
    });
  }

  Future<void> addOrder(List<CartItemProvider> cartProducts) async {
    var url =
        Uri.parse('https://shop-36394-default-rtdb.firebaseio.com/orders.json');
    final timestamp = DateTime.now();
    double total = 0;
    cartProducts.forEach((element) {
      total += element.price! * element.quantity!;
    });
    final response = await http.post(
      url,
      body: jsonEncode({
        'amount': total,
        'dateTime': timestamp.toIso8601String(),
        'products': cartProducts
            .map((element) => {
                  'id': element.id,
                  'title': element.title,
                  'quantity': element.quantity,
                  'price': element.price,
                  'imageUrl': element.imgUrl,
                })
            .toList(),
      }),
    );
    _order.insert(
      0,
      OrderItem(
        id: jsonDecode(response.body)['name'],
        amount: total,
        dateTime: timestamp,
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
