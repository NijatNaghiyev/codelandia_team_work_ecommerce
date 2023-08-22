import 'package:codelandia_team_work_ecommerce/get_x/state/cart_list_get_x.dart';
import 'package:codelandia_team_work_ecommerce/get_x/state/favorite_list_get_x.dart';
import 'package:codelandia_team_work_ecommerce/get_x/state/product_list_get_x.dart';
import 'package:codelandia_team_work_ecommerce/hive/favorite_list_hive.dart';
import 'package:codelandia_team_work_ecommerce/screens/product_screen.dart';
import 'package:codelandia_team_work_ecommerce/service/model/products_model.dart';
import 'package:codelandia_team_work_ecommerce/utilities/constants/category_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../generated/assets.dart';
import '../hive/cart_list_hive.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    CartList cartListController = Get.put(CartList());
    ProductList productListController = Get.put(ProductList());
    FavoriteList favoriteListController = Get.put(FavoriteList());

    List<Product> favoriteList = productListController.productListGetX
        .where((e) => favoriteListController.favoriteList.contains(e.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('favorite'.tr),
        centerTitle: true,
      ),
      body: favoriteListController.favoriteList.isEmpty
          ? Center(
              child: Lottie.asset(Assets.lottieNotFound),
            )
          : Obx(() {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: favoriteListController.favoriteList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductScreen(
                              product: productListController.productListGetX
                                  .where((e) =>
                                      e.id ==
                                      favoriteListController
                                          .favoriteList[index])
                                  .first),
                        ),
                      );
                    },
                    child: Dismissible(
                      onDismissed: (direction) {
                        setState(() {});
                        putAndRemoveFavoriteList(
                            favoriteListController.favoriteList[index]);
                      },
                      background: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          color: Colors.red,
                          child: const Icon(
                            Icons.delete,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      direction: DismissDirection.endToStart,
                      key: ValueKey(favoriteListController.favoriteList[index]),
                      child: Card(
                        color: Colors.teal[300],
                        clipBehavior: Clip.hardEdge,
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                IntrinsicHeight(
                                  child: Image.network(
                                    filterQuality: FilterQuality.high,
                                    productListController.productListGetX
                                        .where((e) =>
                                            e.id ==
                                            favoriteListController
                                                .favoriteList[index])
                                        .first
                                        .thumbnail,
                                    width: Get.width * 0.4,
                                    height: Get.height * 0.22,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                Obx(
                                  () {
                                    return Positioned(
                                      right: 0,
                                      child: Card(
                                        color: Colors.white70,
                                        child: IconButton(
                                          onPressed: () {
                                            putAndRemoveCartList(
                                                favoriteListController
                                                    .favoriteList[index]);
                                          },
                                          icon: Icon(
                                            isCart(favoriteListController
                                                    .favoriteList[index])
                                                ? Icons.shopping_cart
                                                : Icons.shopping_cart_outlined,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                            IntrinsicHeight(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        Card(
                                          color: Color(kCategoryBackgroundColor[
                                              productListController
                                                  .productListGetX
                                                  .where((e) =>
                                                      e.id ==
                                                      favoriteListController
                                                          .favoriteList[index])
                                                  .first
                                                  .category]!),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              productListController
                                                  .productListGetX
                                                  .where((e) =>
                                                      e.id ==
                                                      favoriteListController
                                                          .favoriteList[index])
                                                  .first
                                                  .category
                                                  .tr,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Card(
                                          color: Colors.blue,
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              productListController
                                                  .productListGetX
                                                  .where((e) =>
                                                      e.id ==
                                                      favoriteListController
                                                          .favoriteList[index])
                                                  .first
                                                  .brand
                                                  .tr,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: Get.width * 0.5,
                                          child: Text(
                                            overflow: TextOverflow.ellipsis,
                                            productListController
                                                .productListGetX
                                                .where((e) =>
                                                    e.id ==
                                                    favoriteListController
                                                        .favoriteList[index])
                                                .first
                                                .title,
                                            style: GoogleFonts.openSans(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        RatingBarIndicator(
                                          rating: productListController
                                              .productListGetX
                                              .where((e) =>
                                                  e.id ==
                                                  favoriteListController
                                                      .favoriteList[index])
                                              .first
                                              .rating,
                                          itemBuilder: (context, index) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 15.0,
                                          direction: Axis.horizontal,
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Card(
                                        color: Colors.purple,
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            "${'Stock'.tr}: ${productListController.productListGetX.where((e) => e.id == favoriteListController.favoriteList[index]).first.stock.toString()}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Card(
                                        color: Colors.pink,
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            "${'Price'.tr}: \$${productListController.productListGetX.where((e) => e.id == favoriteListController.favoriteList[index]).first.price.toString()}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
    );
  }
}
