import 'package:flutter/cupertino.dart';
import 'package:shop_app/providers/cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;
  OrderItem({
    required this.id,
    required this.products,
    required this.amount,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _order = [];
  List<OrderItem> get order {
    return [..._order];
  }

  void addOrder(
    List<CartItem> cartProducts,
    double total,
    DateTime dateTime,
  ) {
    _order.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        products: cartProducts,
        amount: total,
        dateTime: dateTime,
      ),
    );
    notifyListeners();
  }
}
