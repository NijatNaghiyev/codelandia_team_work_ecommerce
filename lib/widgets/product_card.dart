import 'package:animations/animations.dart';
import 'package:codelandia_team_work_ecommerce/get_x/state/product_list_get_x.dart';
import 'package:codelandia_team_work_ecommerce/hive/cart_list_hive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../generated/assets.dart';
import '../hive/favorite_list_hive.dart';
import '../screens/product_screen.dart';
import '../service/api/products_api.dart';
import '../utilities/methods/product_card_title_rating.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    ProductList getController = Get.put(ProductList());

    return FutureBuilder(
      future: fetchProducts(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: Get.height * 0.4,
                  minWidth: Get.width,
                ),
                child: Center(
                  child: Lottie.asset(Assets.lottieLottieLoading),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: Get.height * 0.4,
                    minWidth: Get.width,
                  ),
                  child: Obx(
                    () {
                      if (getController.productListGetX.isEmpty) {
                        return Center(
                          child: Lottie.asset(Assets.lottieNotFound),
                        );
                      }
                      return GridView.builder(
                        controller: scrollController,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: getController.productListGetX.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1 / 1.4,
                        ),
                        itemBuilder: (context, index) {
                          return OpenContainer(
                            closedColor: Colors.transparent,
                            transitionDuration:
                                const Duration(milliseconds: 500),
                            openBuilder: (context, action) => ProductScreen(
                                product: getController.productListGetX[index]),
                            closedBuilder: (context, openContainer) => Card(
                              clipBehavior: Clip.hardEdge,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      getController
                                          .productListGetX[index].images.last,
                                      height: Get.height * 0.1,
                                      width: double.infinity,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 8, 0, 0),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            buildProductCardTitleRating(
                                              context,
                                              getController.productListGetX,
                                              index,
                                            ),
                                            Column(
                                              children: [
                                                Obx(
                                                  () {
                                                    return IconButton(
                                                      onPressed: () {
                                                        putAndRemoveFavoriteList(
                                                            getController
                                                                .productListGetX[
                                                                    index]
                                                                .id);
                                                      },
                                                      icon: Icon(
                                                        isFavorite(getController
                                                                .productListGetX[
                                                                    index]
                                                                .id)
                                                            ? Icons.favorite
                                                            : Icons
                                                                .favorite_outline,
                                                        color: Colors.red,
                                                      ),
                                                    );
                                                  },
                                                ),
                                                Obx(
                                                  () {
                                                    return IconButton(
                                                      onPressed: () {
                                                        putAndRemoveCartList(
                                                            getController
                                                                .productListGetX[
                                                                    index]
                                                                .id);
                                                      },
                                                      icon: Icon(
                                                        isCart(getController
                                                                .productListGetX[
                                                                    index]
                                                                .id)
                                                            ? Icons
                                                                .shopping_cart
                                                            : Icons
                                                                .shopping_cart_outlined,
                                                        color: Colors.green,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "\$${getController.productListGetX[index].price}",
                                            style: const TextStyle(
                                              color: Colors.blue,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              );
      },
    );
  }
}
