import 'package:teamapt/modules/home/domain/models/product.dart';

class Cart {
  late int id;
  late Product product;
  late int quantity;
  late String color;
  Cart(
      {required this.product,
      required this.quantity,
      required this.color,
      required this.id});
}
