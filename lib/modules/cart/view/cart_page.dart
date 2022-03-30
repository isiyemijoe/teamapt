import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teamapt/animation/bottom_up_animations.dart';
import 'package:teamapt/modules/cart/domain/controller/cart_controller.dart';
import 'package:teamapt/modules/cart/domain/models/cart.dart';
import 'package:teamapt/modules/home/domain/controller/home_controller.dart';
import 'package:teamapt/modules/home/domain/models/product.dart';
import 'package:teamapt/modules/home/views/product_details_page.dart';
import 'package:teamapt/ui/widgets/cart_item.dart';
import 'package:teamapt/utils/colors.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CartPage> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.lightCream,
        appBar: AppBar(
          title: Text(
            'Cart',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: AppColor.lightCream,
        ),
        body: Column(
          children: [
            Expanded(child: Consumer(builder: (_, ref, __) {
              var controller = ref.watch(cartController);

              return controller.cartList.isEmpty
                  ? const Center(
                      child: Text("You currently have no item in your cart"))
                  : ListView.builder(
                      itemCount: controller.cartList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, ProductPage.routeName,
                                arguments: controller.cartList[index].product);
                          },
                          child: CartItem(cartItem: controller.cartList[index]),
                        );
                      });
            }))
          ],
        ));
  }
}
