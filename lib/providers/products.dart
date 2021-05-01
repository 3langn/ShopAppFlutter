import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/models/http_exception.dart';
import 'package:shop_app/providers/product.dart';

class Products with ChangeNotifier {
  List<Product>? _items = [];

  bool showFavoritesOnly = false;
  late final String? authToken;
  void update(String? authToken, List<Product>? item) {
    this.authToken = authToken;
    this._items = items;
  }

  List<Product>? get items {
    if (showFavoritesOnly) {
      return _items!.where((prodItem) => prodItem.isFavorite).toList();
    }
    return [..._items!];
  }

  List<Product> searchProduct(String? search) {
    return [
      ...items!
          .where((element) => element.title.toLowerCase().startsWith(search!))
    ];
  }

  List<Product> get favoritesItem {
    return _items!.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items!.firstWhere((prod) => prod.id == id);
  }

  Future<void> fetchAndSetProducts() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://shop-36394-default-rtdb.firebaseio.com/products.json?auth=$authToken'),
      );
      final extractedData = jsonDecode(response.body) as Map<String, dynamic>?;
      if (extractedData == null) return;
      final List<Product> loadedProduct = [];
      extractedData.forEach((productId, productData) {
        loadedProduct.add(Product(
          id: productId,
          imageUrl: productData['imageUrl'],
          price: productData['price'],
          isFavorite: productData['isFavorite'],
          description: productData['description'],
          title: productData['title'],
          rating: productData['rating'].toDouble(),
        ));
      });
      _items = loadedProduct;
      notifyListeners();
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> addProduct(Product editedProduct) async {
    try {
      final response = await http.post(
        Uri.parse(
            'https://shop-36394-default-rtdb.firebaseio.com/products.json?auth=$authToken'),
        body: jsonEncode(
          {
            'title': editedProduct.title,
            'description': editedProduct.description,
            'price': editedProduct.price,
            'imageUrl': editedProduct.imageUrl,
            'isFavorite': editedProduct.isFavorite,
            'rating': editedProduct.rating,
          },
        ),
      );
      final newProduct = Product(
        title: editedProduct.title,
        description: editedProduct.description,
        price: editedProduct.price,
        imageUrl: editedProduct.imageUrl,
        id: jsonDecode(response.body)['name'],
        rating: editedProduct.rating,
      );
      _items!.add(newProduct);
      notifyListeners();
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> updateProduct(String? id, Product newProduct) async {
    final prodIndex = _items!.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      try {
        await http.patch(
          Uri.parse(
              'https://shop-36394-default-rtdb.firebaseio.com/products/$id.json?auth=$authToken'),
          body: jsonEncode({
            'title': newProduct.title,
            'description': newProduct.description,
            'price': newProduct.price,
            'imageUrl': newProduct.imageUrl,
          }),
        );
      } catch (e) {
        print(e);
      }
      _items![prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  Future<void> removeProduct(String? id) async {
    final url =
        'https://shop-36394-default-rtdb.firebaseio.com/products/$id.json?auth=$authToken';
    final existingProductIndex =
        _items!.indexWhere((element) => element.id == id);
    var existingProductItem = _items![existingProductIndex];
    _items!.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(Uri.parse(url));
    if (response.statusCode >= 400) {
      _items!.insert(existingProductIndex, existingProductItem);
      notifyListeners();
      throw HttpException('Could not delete products.');
    }
  }
}
