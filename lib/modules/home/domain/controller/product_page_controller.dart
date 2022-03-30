import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teamapt/modules/cart/domain/models/cart.dart';
import 'package:teamapt/modules/home/domain/controller/home_controller.dart';
import 'package:teamapt/modules/home/domain/models/product.dart';
import 'package:teamapt/utils/constants.dart';

var productPageController =
    ChangeNotifierProvider((ref) => ProductPageController(ref: ref));

class ProductPageController extends ChangeNotifier {
  ProductPageController({this.ref});
  Ref? ref;
  Product? product;
  int _quantity = 0;
  String _color = "";

  String get color => _color;
  int get quantity => _quantity;

  set quantity(int newQuantity) {
    if (newQuantity <= 0) return;
    _quantity = newQuantity;
    notifyListeners();
  }

  set color(String newColor) {
    _color = newColor;
    notifyListeners();
  }

  init(Product prd) {
    product = prd;
    _quantity = 1;
    _color = prd.colors[0];
  }

  addToCart(BuildContext context) {
    bool res = ref!
        .read(homeController)
        .addToCart(product!, _quantity, _color, context);
    if (res) {
      product!.inCart = true;
    }
    notifyListeners();
  }

  removeFromCart(int id) {
    ref!.read(homeController).removeFromCart(product!.id);
    product!.inCart = false;
    notifyListeners();
  }

  favorite() {
    bool state = product!.isFavorite;
    ref!.read(homeController).toggleFavorite(product!.id, favorite: !state);
    product!.isFavorite = !state;
    log(product!.isFavorite.toString());
    notifyListeners();
  }

  clear() {
    product = null;
    color = "";
    _quantity = 0;
  }
}
