import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teamapt/animation/bottom_up_animations.dart';
import 'package:teamapt/modules/home/domain/controller/home_controller.dart';
import 'package:teamapt/modules/home/domain/models/product.dart';
import 'package:teamapt/ui/widgets/favorite_item.dart';
import 'package:teamapt/utils/colors.dart';

class FavoritePage extends ConsumerStatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  ConsumerState<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends ConsumerState<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.lightCream,
        appBar: AppBar(
          title: Text(
            'Favorite',
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
              var controller = ref.watch(homeController);
              List<Product> favList = controller.getFavorites();
              return favList.isEmpty
                  ? const Center(
                      child: Text("You favorite products will show here"))
                  : ListView.builder(
                      itemCount: favList.length,
                      itemBuilder: (context, index) {
                        return FavoriteItem(
                            product: favList[index], controller: controller);
                      });
            }))
          ],
        ));
  }
}
