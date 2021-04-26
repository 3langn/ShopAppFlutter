import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItemProvider with ChangeNotifier {
  final String id;
  final String title;
  final String imgUrl;
  final double price;
  final int quantity;
  bool isSelected;
  CartItemProvider({
    this.isSelected = false,
    required this.title,
    required this.id,
    required this.imgUrl,
    required this.price,
    required this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItemProvider> _items = {};

  Map<String, CartItemProvider> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  int get totalIsSelected {
    int total = 0;
    _items.values.forEach((element) {
      if (element.isSelected) total += element.quantity;
    });
    return total;
  }

  void changeQuantity(String productId, int btn, BuildContext context) {
    _items.update(productId, (existingCartItem) {
      int quantity = existingCartItem.quantity;
      if (btn == 0) {
        if (quantity == 1) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              content: Text(
                'Do you want remove this item ?',
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    _items.remove(productId);
                    notifyListeners();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Remove',
                    style: TextStyle(
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                )
              ],
            ),
          );
        } else
          quantity--;
      } else if (btn == 1) {
        quantity++;
      }
      return CartItemProvider(
        id: existingCartItem.id,
        title: existingCartItem.title,
        imgUrl: existingCartItem.imgUrl,
        price: existingCartItem.price,
        quantity: quantity,
      );
    });
    notifyListeners();
  }

  void clear() {
    _items.removeWhere((key, value) => value.isSelected);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (_items[productId]!.quantity > 1) {
      _items.update(productId, (existingCartItem) {
        return CartItemProvider(
          isSelected: !existingCartItem.isSelected,
          id: existingCartItem.id,
          title: existingCartItem.title,
          imgUrl: existingCartItem.imgUrl,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity - 1,
        );
      });
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  double get totalPrice {
    double totalPrice = 0;
    _items.forEach((key, value) {
      if (value.isSelected) {
        totalPrice += value.quantity * value.price;
      }
    });
    return totalPrice;
  }

  void toggleSelected(String productId) {
    _items.update(productId, (existingCartItem) {
      return CartItemProvider(
        isSelected: !existingCartItem.isSelected,
        id: existingCartItem.id,
        title: existingCartItem.title,
        imgUrl: existingCartItem.imgUrl,
        price: existingCartItem.price,
        quantity: existingCartItem.quantity,
      );
    });
    notifyListeners();
  }

  void addItem(String productId, String title, String imgUrl, double price) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingCartItem) => CartItemProvider(
          isSelected: existingCartItem.isSelected,
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
        () => CartItemProvider(
          title: title,
          id: productId,
          imgUrl: imgUrl,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }
}
