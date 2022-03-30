import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teamapt/modules/cart/domain/controller/cart_controller.dart';
import 'package:teamapt/modules/home/domain/models/product.dart';
import 'package:teamapt/utils/constants.dart';

var homeController = ChangeNotifierProvider((ref) => HomeController(ref: ref));

class HomeController extends ChangeNotifier {
  HomeController({this.ref});
  Ref? ref;

  List<Product> productList = Constant.productList;

  int _currentPage = 0;

  int _currentTab = 0;

  int get currentPage => _currentPage;
  int get currentTab => _currentTab;

  set currentPage(int index) {
    _currentPage = index;
    notifyListeners();
  }

  set currentTab(int index) {
    _currentTab = index;
    filterProductList();
    notifyListeners();
  }

  List<Product> filterProductList() {
    return productList
        .where((element) => element.categoryId == currentTab)
        .toList();
  }

  toggleFavorite(int productId, {bool favorite = true}) {
    int index = getIndex(productId);
    productList[index].isFavorite = favorite;
    filterProductList();
    notifyListeners();
  }

  List<Product> getFavorites() {
    return productList.where((element) => element.isFavorite).toList();
  }

  bool addToCart(
      Product product, int quantity, String color, BuildContext context) {
    int index = getIndex(product.id);
    productList[index].inCart = !productList[index].inCart;
    var res = ref!
        .read(cartController)
        .addToCart(product: product, quantity: quantity, color: color);
    if (res) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Item added to cart succesfully")));
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error occured while adding to cart, Please try again"),
        backgroundColor: Colors.red,
      ));
      return false;
    }
  }

  removeFromCart(int id) {
    ref!.read(cartController).removeFromCart(id);
    ;
  }

  getIndex(int product) =>
      productList.indexWhere((element) => element.id == product);
}
