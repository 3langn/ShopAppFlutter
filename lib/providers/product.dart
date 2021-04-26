import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });
  void _setFavValue(bool newFav) {
    isFavorite = newFav;
    notifyListeners();
  }

  void toggleFavoriteStatus() async {
    var url = Uri.parse(
        'https://shop-36394-default-rtdb.firebaseio.com/products/$id.json');
    final oldFavorite = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    try {
      final response = await http.patch(
        url,
        body: jsonEncode({'isFavorite': isFavorite}),
      );
      if (response.statusCode >= 400) {
        _setFavValue(oldFavorite);
      }
    } catch (e) {
      _setFavValue(oldFavorite);
    }
  }
}
