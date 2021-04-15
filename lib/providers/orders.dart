import 'package:flutter/cupertino.dart';
import 'package:shop_app/providers/cart.dart';

class OrderItem with ChangeNotifier {
  String? _id;
  List<CartItem> _products = [];
  List<CartItem>? get products {
    return [..._products];
  }

  OrderItem();
  String? get id => _id;
  double get total {
    double _total = 0;
    _products.forEach((cartItem) {
      _total += cartItem.price;
    });
    return _total;
  }

  void add(CartItem cartItem) {
    _id = DateTime.now().toString();
    _products.insert(0, cartItem);
    print("Đã add vô ordertitem");
    notifyListeners();
  }
}

class Orders with ChangeNotifier {
  List<OrderItem> _order = [];
  List<OrderItem> get order {
    return [..._order];
  }

  void addOrder(OrderItem orderItem) {
    _order.insert(
      0,
      orderItem,
    );
    print("Orders PVD");
    notifyListeners();
  }
}
