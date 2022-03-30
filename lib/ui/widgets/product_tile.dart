import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:teamapt/modules/home/domain/models/product.dart';
import 'package:teamapt/modules/home/views/product_details_page.dart';
import 'package:teamapt/utils/helpers.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final VoidCallback onFavorite;
  const ProductTile({Key? key, required this.product, required this.onFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductPage.routeName, arguments: product);
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                      imageUrl: product.imageUrls[0],
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (BuildContext, String, DownloadProgress) {
                        return SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.white,
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }),
                )),
          ),
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.1),
                  Colors.transparent
                ], begin: Alignment.bottomRight),
              ),
            ),
          ),
          Positioned(
              bottom: 08,
              left: 20,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        product.subtitle,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Material(
                      color: Colors.transparent,
                      child: IconButton(
                          onPressed: () => onFavorite(),
                          icon: SvgPicture.asset(Helpers.getAsset(
                              product.isFavorite
                                  ? "heart_filled.svg"
                                  : "heart_unfilled.svg",
                              isSvg: true))),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
