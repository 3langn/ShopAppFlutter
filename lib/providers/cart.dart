import 'package:flutter/cupertino.dart';

class CartItem {
  String id;
  String title;
  String imgUrl;
  double price;
  int quantity;
  CartItem({
    @required this.title,
    @required this.id,
    @required this.imgUrl,
    @required this.price,
    @required this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void changeQuantity(String productId, int btn) {
    _items.update(
      productId,
      (existingCartItem) => CartItem(
        id: existingCartItem.id,
        title: existingCartItem.title,
        imgUrl: existingCartItem.imgUrl,
        price: existingCartItem.price,
        quantity: existingCartItem.quantity + 1,
      ),
    );
    notifyListeners();
  }

  double get totalPrice {
    double _totalPrice = 0;
    _items.forEach((key, cart) {
      _totalPrice += cart.price * cart.quantity;
    });
    return _totalPrice;
  }

  void addItem(String productId, String title, String imgUrl, double price) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          imgUrl: existingCartItem.imgUrl,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          title: title,
          id: DateTime.now().toString(),
          imgUrl: imgUrl,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }
}
