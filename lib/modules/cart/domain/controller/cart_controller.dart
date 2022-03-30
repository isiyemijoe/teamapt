import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teamapt/modules/cart/domain/models/cart.dart';
import 'package:teamapt/modules/home/domain/models/product.dart';
import 'package:teamapt/utils/constants.dart';

var cartController = ChangeNotifierProvider((ref) => CartController(ref: ref));

class CartController extends ChangeNotifier {
  CartController({this.ref});
  Ref? ref;

  List<Cart> cartList = <Cart>[];

  addToCart(
      {required Product product,
      required int quantity,
      required String color}) {
    if (!cartList.map((e) => e.id).toList().contains(product.id)) {
      cartList.add(Cart(
          color: color, product: product, quantity: quantity, id: product.id));
      notifyListeners();
      return true;
    }
    return false;
  }

  removeFromCart(int id) {
    cartList.removeWhere((element) => element.id == id);
  }
}
