import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:teamapt/animation/slide_in_right.dart';
import 'package:teamapt/animation/slide_left_animation.dart';
import 'package:teamapt/modules/home/domain/controller/home_controller.dart';
import 'package:teamapt/modules/home/domain/models/product.dart';
import 'package:teamapt/modules/home/views/product_details_page.dart';
import 'package:teamapt/ui/widgets/product_tile.dart';
import 'package:teamapt/utils/colors.dart';
import 'package:teamapt/utils/constants.dart';
import 'package:teamapt/utils/helpers.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.pink,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SlideInLeftAnimation(
                delay: 0.5,
                curve: Curves.easeInOut,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text(
                    "Discover \nNew items",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: SlideInLeftAnimation(
                    delay: 0.5,
                    curve: Curves.easeInOut,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey.shade500,
                            ),
                            hintText: "Search products",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(fontWeight: FontWeight.w400),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                  )),
                  SlideInRightAnimation(
                    delay: 0.2,
                    //curve: Curves.easeInOut,
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.grey.shade500,
                            Colors.black,
                            Colors.black
                          ], begin: Alignment.topLeft),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(
                        Icons.filter_alt_outlined,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SlideInLeftAnimation(
                  delay: 0.2,
                  curve: Curves.easeInOut,
                  child: Consumer(builder: (_, ref, __) {
                    var controller = ref.read(homeController);
                    return TabBar(
                      // controller: controller.tabController,
                      isScrollable: false,
                      indicatorPadding:
                          const EdgeInsets.symmetric(horizontal: 20),

                      indicatorColor: AppColor.textColor,
                      labelStyle: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(
                              color: AppColor.textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                      unselectedLabelStyle: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 14),
                      labelColor: AppColor.textColor,
                      unselectedLabelColor: Colors.black.withOpacity(0.5),
                      physics: BouncingScrollPhysics(),
                      onTap: (_) {
                        log(_.toString());
                        controller.currentTab = _;
                        controller.filterProductList();
                      },
                      tabs: Constant.tabs
                          .map(
                            (e) => Tab(
                              text: e,
                            ),
                          )
                          .toList(),
                    );
                  }),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                  child: SlideInRightAnimation(
                delay: 0.2,
                displacement: 200,
                curve: Curves.bounceOut,
                child: Consumer(builder: (_, ref, __) {
                  var controller = ref.watch(homeController);
                  return CarouselSlider(
                    items: controller.filterProductList().map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return ProductTile(
                            product: i,
                            onFavorite: () => ref
                                .read(homeController)
                                .toggleFavorite(i.id, favorite: !i.isFavorite),
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
                      enlargeCenterPage: false,
                      onPageChanged: (index, reason) {},
                      scrollDirection: Axis.horizontal,
                    ),
                  );
                }),
              )),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
