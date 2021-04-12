import 'package:flutter/cupertino.dart';

class CartItem {
  String id;
  String title;
  double price;
  int quantity;
  CartItem({
    @required this.title,
    @required this.id,
    @required this.price,
    @required this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items;
  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemsCount {
    return _items.length;
  }

  void addItem(String productId, String title, double price) {
    if (items.containsKey(productId)) {
      items.update(
        productId,
        (existingCartItem) => CartItem(
          title: existingCartItem.title,
          id: existingCartItem.id,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      items.putIfAbsent(
        productId,
        () => CartItem(
          title: DateTime.now().toString(),
          id: productId,
          price: price,
          quantity: 1,
        ),
      );
    }
  }
}
