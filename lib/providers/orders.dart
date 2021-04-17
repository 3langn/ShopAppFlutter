import 'package:flutter/cupertino.dart';
import 'package:shop_app/providers/cart.dart';

class OrderItem {
  final List<CartItemProvider> products;
  OrderItem({required this.products});
}

class Orders with ChangeNotifier {
  List<OrderItem> _order = [];
  List<OrderItem> get order {
    return [..._order];
  }

  void addOrder(OrderItem orderItem) {
    print('Add orders');
    _order.insert(
      0,
      orderItem,
    );
    notifyListeners();
  }
}
