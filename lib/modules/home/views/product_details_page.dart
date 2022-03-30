import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teamapt/animation/slide_in_right.dart';
import 'package:teamapt/modules/home/domain/controller/product_page_controller.dart';
import 'package:teamapt/modules/home/domain/models/product.dart';
import 'package:teamapt/ui/widgets/product_image_tile.dart';
import 'package:teamapt/utils/colors.dart';
import 'package:teamapt/utils/constants.dart';
import 'package:teamapt/utils/extensions.dart';
import 'package:teamapt/utils/helpers.dart';

import 'dashboard.dart';

class ProductPage extends ConsumerStatefulWidget {
  static const String routeName = "/product";
  const ProductPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<ProductPage> {
  late Product product;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    product = ModalRoute.of(context)!.settings.arguments as Product;
    ref.read(productPageController).init(product);
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ref.read(productPageController).clear();
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColor.productCream,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        splashColor: Colors.transparent,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Container(
                          padding: const EdgeInsets.only(
                              top: 10, left: 13, right: 7, bottom: 10),
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            size: 14,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: SlideInRightAnimation(
                      delay: 0.2,
                      displacement: 200,
                      curve: Curves.bounceOut,
                      child: CarouselSlider(
                        items: product.imageUrls.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return ProductImageTile(
                                url: i,
                              );
                            },
                          );
                        }).toList(),
                        options: CarouselOptions(
                          height: double.infinity,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.70,
                          initialPage: 0,
                          enableInfiniteScroll: false,
                          reverse: false,
                          autoPlay: false,
                          pageSnapping: true,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: false,
                          onPageChanged: (index, reason) {},
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 18),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                product.subtitle,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                          Text(
                            "\$${product.price}",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 20,
                                      //   letterSpacing: 1,
                                      fontWeight: FontWeight.w300,
                                    ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(product.description,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontWeight: FontWeight.w500, fontSize: 13)),
                      const SizedBox(
                        height: 20,
                      ),
                      Consumer(builder: (_, ref, __) {
                        var controller = ref.watch(productPageController);
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: product.colors
                                  .map((element) => GestureDetector(
                                        onTap: () {
                                          controller.color = element;
                                        },
                                        child: Container(
                                          // padding: EdgeInsets.symmetric(horizontal: 0.5),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: controller.color == element
                                                ? Border.all(
                                                    color: Color(int.parse(
                                                            "0xff${element}"))
                                                        .withOpacity(0.4),
                                                    width: 3)
                                                : null,
                                          ),
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 2),
                                            decoration: BoxDecoration(
                                                color: Color(int.parse(
                                                    "0xff${element}")),
                                                shape: BoxShape.circle),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                            Container(
                              //   padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  color: AppColor.lightCream,
                                  borderRadius: BorderRadius.circular(23)),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {
                                      controller.quantity -= 1;
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 13, horizontal: 7),
                                      child: SizedBox(
                                        height: 4,
                                        width: 13,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Container(
                                  //     height: 4,
                                  //     width: 13,
                                  //     decoration: BoxDecoration(
                                  //         color: Colors.black,
                                  //         borderRadius: BorderRadius.circular(10))),
                                  const SizedBox(width: 10),
                                  Text(controller.quantity.toString()),
                                  const SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () {
                                      controller.quantity += 1;
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: const BoxDecoration(
                                          color: Colors.black,
                                          shape: BoxShape.circle),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      }),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Consumer(builder: (_, ref, __) {
                        var controller = ref.watch(productPageController);
                        return Row(
                          children: [
                            const SizedBox(
                              width: 60,
                            ),
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: MaterialButton(
                                  height: 50,
                                  minWidth: double.infinity,
                                  color: AppColor.btnColor,
                                  disabledColor: Colors.grey.shade300,
                                  onPressed: controller.product!.inCart
                                      ? null
                                      : () {
                                          controller.addToCart(context);
                                        },
                                  child: Text(
                                    controller.product!.inCart
                                        ? "ITEM ALREADY IN CART"
                                        : "ADD TO CART",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Material(
                                color: Colors.transparent,
                                child: IconButton(
                                    onPressed: () {
                                      controller.favorite();
                                    },
                                    icon: SvgPicture.asset(Helpers.getAsset(
                                        controller.product!.isFavorite
                                            ? "heart_filled.svg"
                                            : "heart_unfilled.svg",
                                        isSvg: true))),
                              ),
                            )
                          ],
                        );
                      })
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
