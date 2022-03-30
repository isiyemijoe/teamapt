import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teamapt/animation/bottom_up_animations.dart';
import 'package:teamapt/modules/cart/view/cart_page.dart';
import 'package:teamapt/modules/favorite/views/favorite_page.dart';
import 'package:teamapt/modules/home/domain/controller/home_controller.dart';
import 'package:teamapt/utils/colors.dart';
import 'package:teamapt/utils/constants.dart';
import 'package:teamapt/utils/helpers.dart';

import 'dashboard.dart';

class Homepage extends StatefulWidget {
  static const String routeName = "/homepage";
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Consumer(builder: (_, ref, __) {
          var currentPage = ref.watch(homeController).currentPage;
          return IndexedStack(
            index: currentPage,
            children: const [
              Dashboard(),
              FavoritePage(),
              CartPage(),
            ],
          );
        })),
        Positioned(
            bottom: 10,
            left: 25,
            right: 25,
            child: BottomUpAnimaitons(
              delay: 0.2,
              child: Consumer(builder: (_, ref, __) {
                var controller = ref.watch(homeController);
                return Container(
                  height: 65,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset(0, 0),
                            spreadRadius: 10,
                            blurRadius: 50)
                      ],
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      navBarItem(context, "home.svg",
                          (controller.currentPage == 0), 0, controller),
                      navBarItem(context, "heart_filled.svg",
                          (controller.currentPage == 1), 1, controller),
                      navBarItem(context, "cart.svg",
                          (controller.currentPage == 2), 2, controller),
                    ],
                  ),
                );
              }),
            ))
      ],
    );
  }
}

Widget navBarItem(BuildContext context, String asset, bool isSelected,
    int index, HomeController controller) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(60),
    child: MaterialButton(
      onPressed: () {
        controller.currentPage = index;
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: SvgPicture.asset(
              Helpers.getAsset(asset, isSvg: true),
              color: isSelected ? AppColor.textColor : Colors.white,
              height: isSelected ? 24 : 22,
              width: isSelected ? 24 : 22,
            ),
          ),
        ],
      ),
    ),
  );
}
