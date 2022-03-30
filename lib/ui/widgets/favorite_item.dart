import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:teamapt/animation/bottom_up_animations.dart';
import 'package:teamapt/modules/home/domain/controller/home_controller.dart';
import 'package:teamapt/modules/home/domain/models/product.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({
    Key? key,
    required this.product,
    required this.controller,
  }) : super(key: key);

  final Product product;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: BottomUpAnimaitons(
        delay: 0.5,
        child: Stack(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 30),
                height: 130,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 30),
                          blurRadius: 40,
                          color: Colors.black.withOpacity(0.1))
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.28,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        child: CachedNetworkImage(
                          height: 130,
                          imageUrl: product.imageUrls[0],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(0, 10, 10, 20),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.toggleFavorite(product.id,
                                    favorite: false);
                              },
                              child: const Align(
                                alignment: Alignment.topRight,
                                child: Icon(
                                  Icons.cancel_rounded,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Text(product.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                                fontSize: 16)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  )
                                  // Text(
                                  //   "Mariam Abagana Stores",
                                  //   style: Get.textTheme.caption
                                  //       .copyWith(fontSize: 14),
                                  // ),
                                ],
                              ),
                            ),
                            Text(
                              "\$${product.price.toDouble()}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            Positioned(
                bottom: 0,
                right: 40,
                child: GestureDetector(
                  onTap: () async {
                    //  ref.read(provider)
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.black, shape: BoxShape.circle),
                    child: Icon(
                      Icons.add_shopping_cart,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
