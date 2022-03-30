import 'package:flutter/material.dart';

class Product {
  final int id;
  final List<String> imageUrls;
  final String name;
  final String subtitle;
  final double price;
  final String currency;
  final String description;
  final List<String> colors;
  bool isFavorite;
  bool inCart;
  final int categoryId;

  Product(
      {required this.id,
      required this.imageUrls,
      required this.name,
      required this.subtitle,
      required this.price,
      required this.currency,
      required this.description,
      required this.colors,
      required this.isFavorite,
      required this.inCart,
      required this.categoryId});
}
