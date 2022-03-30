import 'package:teamapt/modules/home/domain/models/product.dart';

class Constant {
  static const String imgPath = "assets/images/";
  static const String svgPath = "assets/svgs/";

  static List<Product> productList = [
    Product(
        id: 1,
        imageUrls: [img5, img2, img7, img4],
        name: "Noom Candles",
        price: 200.00,
        currency: "\$",
        description:
            "Meridian Furniture Bliss Collection Modern | Contemporary Velvet Upholstered Bed with Deep Button Tufting and Storage Compartments in Rails and Footboard, Gray, Queen",
        colors: ["83a99f", "393780", "f3b7ae"],
        isFavorite: false,
        subtitle: "Gabo Vases",
        categoryId: 0,
        inCart: false),
    Product(
        id: 2,
        imageUrls: [
          img7,
          img2,
          img3,
          img4,
        ],
        name: "Noom Candles",
        price: 200.00,
        currency: "\$",
        subtitle: "Gabo Vases",
        description:
            "Meridian Furniture Bliss Collection Modern | Contemporary Velvet Upholstered Bed with Deep Button Tufting and Storage Compartments in Rails and Footboard, Gray, Queen",
        colors: ["000000", "bcb9a8", "393780"],
        isFavorite: false,
        categoryId: 1,
        inCart: false),
    Product(
        id: 3,
        imageUrls: [
          img4,
          img1,
          img2,
          img3,
        ],
        name: "Noom Candles",
        price: 200.00,
        currency: "\$",
        subtitle: "Gabo Vases",
        description:
            "Meridian Furniture Bliss Collection Modern | Contemporary Velvet Upholstered Bed with Deep Button Tufting and Storage Compartments in Rails and Footboard, Gray, Queen",
        colors: ["000000", "bcb9a8", "a8815a"],
        isFavorite: false,
        categoryId: 2,
        inCart: false),
    Product(
        id: 4,
        imageUrls: [
          img6,
          img4,
          img1,
          img2,
        ],
        name: "Noom Candles",
        price: 200.00,
        currency: "\$",
        subtitle: "Gabo Vases",
        description:
            "Meridian Furniture Bliss Collection Modern | Contemporary Velvet Upholstered Bed with Deep Button Tufting and Storage Compartments in Rails and Footboard, Gray, Queen",
        colors: ["000000", "393780"],
        isFavorite: false,
        categoryId: 0,
        inCart: false),
    Product(
        id: 5,
        imageUrls: [
          img2,
          img3,
          img6,
          img8,
        ],
        name: "Noom Candles",
        price: 200.00,
        currency: "\$",
        subtitle: "Gabo Vases",
        description:
            "Meridian Furniture Bliss Collection Modern | Contemporary Velvet Upholstered Bed with Deep Button Tufting and Storage Compartments in Rails and Footboard, Gray, Queen",
        colors: ["83a99f", "393780", "f3b7ae"],
        isFavorite: false,
        categoryId: 1,
        inCart: false),
    Product(
        id: 6,
        imageUrls: [
          img2,
          img3,
          img6,
          img8,
        ],
        name: "Noom Candles",
        price: 200.00,
        currency: "\$",
        subtitle: "Gabo Vases",
        description:
            "Meridian Furniture Bliss Collection Modern | Contemporary Velvet Upholstered Bed with Deep Button Tufting and Storage Compartments in Rails and Footboard, Gray, Queen",
        colors: ["83a99f", "393780", "f3b7ae"],
        isFavorite: false,
        categoryId: 2,
        inCart: false),
    Product(
        id: 7,
        imageUrls: [
          img6,
          img4,
          img1,
          img2,
        ],
        name: "Noom Candles",
        price: 200.00,
        currency: "\$",
        subtitle: "Gabo Vases",
        description:
            "Meridian Furniture Bliss Collection Modern | Contemporary Velvet Upholstered Bed with Deep Button Tufting and Storage Compartments in Rails and Footboard, Gray, Queen",
        colors: ["000000", "393780"],
        isFavorite: false,
        categoryId: 0,
        inCart: false),
    Product(
        id: 8,
        imageUrls: [
          img2,
          img3,
          img6,
          img8,
        ],
        name: "Noom Candles",
        price: 200.00,
        currency: "\$",
        subtitle: "Gabo Vases",
        description:
            "Meridian Furniture Bliss Collection Modern | Contemporary Velvet Upholstered Bed with Deep Button Tufting and Storage Compartments in Rails and Footboard, Gray, Queen",
        colors: ["83a99f", "393780", "f3b7ae"],
        isFavorite: false,
        categoryId: 1,
        inCart: false),
    Product(
        id: 9,
        imageUrls: [
          img2,
          img3,
          img6,
          img8,
        ],
        name: "Noom Candles",
        price: 200.00,
        currency: "\$",
        subtitle: "Gabo Vases",
        description:
            "Meridian Furniture Bliss Collection Modern | Contemporary Velvet Upholstered Bed with Deep Button Tufting and Storage Compartments in Rails and Footboard, Gray, Queen",
        colors: ["83a99f", "393780", "f3b7ae"],
        isFavorite: false,
        categoryId: 2,
        inCart: false)
  ];

  static const List<String> tabs = ["Trending", "Chairs", "Decor"];
  static String img1 =
      "https://firebasestorage.googleapis.com/v0/b/takara-ea489.appspot.com/o/teamapt%2Fprd1.png?alt=media&token=ae2a4504-6795-4a91-ae9c-9f1607827284";

  static String img2 =
      "https://firebasestorage.googleapis.com/v0/b/takara-ea489.appspot.com/o/teamapt%2Fprd2.png?alt=media&token=b5f74d93-a41c-4a76-93f7-23d838338678";

  static String img3 =
      "https://firebasestorage.googleapis.com/v0/b/takara-ea489.appspot.com/o/teamapt%2Fprd3.png?alt=media&token=844971c3-4db3-408c-89ef-bc395177cd52";

  static String img4 =
      "https://firebasestorage.googleapis.com/v0/b/takara-ea489.appspot.com/o/teamapt%2Fprd4.png?alt=media&token=ddf4c185-7b49-4564-b740-63f2a52dde6e";

  static String img5 =
      "https://firebasestorage.googleapis.com/v0/b/takara-ea489.appspot.com/o/teamapt%2Fprd5.png?alt=media&token=fa37230c-9e77-4f5b-9f26-517676d2293b";

  static String img6 =
      "https://firebasestorage.googleapis.com/v0/b/takara-ea489.appspot.com/o/teamapt%2Fprd6.png?alt=media&token=29eaf6e6-9578-4ca4-90ef-1fdd8576f676";

  static String img7 =
      "https://firebasestorage.googleapis.com/v0/b/takara-ea489.appspot.com/o/teamapt%2Fprd7.png?alt=media&token=5c10d248-6353-48fd-936d-fca3b17a155d";

  static String img8 =
      "https://firebasestorage.googleapis.com/v0/b/takara-ea489.appspot.com/o/teamapt%2Fprd8.png?alt=media&token=2c05d787-1abc-4179-ad99-f5fe1ff6c301";
}
