import 'package:flutter/cupertino.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorites;
  Product({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.description,
    @required this.price,
    this.isFavorites = false,
  });
}
