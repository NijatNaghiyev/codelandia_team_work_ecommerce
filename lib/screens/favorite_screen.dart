import 'package:codelandia_team_work_ecommerce/get_x/state/cart_list_get_x.dart';
import 'package:codelandia_team_work_ecommerce/get_x/state/favorite_list_get_x.dart';
import 'package:codelandia_team_work_ecommerce/get_x/state/product_list_get_x.dart';
import 'package:codelandia_team_work_ecommerce/hive/favorite_list_hive.dart';
import 'package:codelandia_team_work_ecommerce/screens/product_screen.dart';
import 'package:codelandia_team_work_ecommerce/service/model/products_model.dart';
import 'package:codelandia_team_work_ecommerce/utilities/constants/category_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilities/methods/product_card_title_rating.dart';
import 'category_details_page.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

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
      body: ListView.builder(
        itemCount: favoriteListController.favoriteList.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProductScreen(product: favoriteList[index]),
              ),
            );
          },
          child: Dismissible(
            onDismissed: (direction) {
              putAndRemoveFavoriteList(favoriteList[index].id);
            },
            background: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                color: Colors.red,
                child: Padding(
                  padding: EdgeInsets.only(left: Get.width * 0.8),
                  child: const Icon(
                    Icons.delete,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            direction: DismissDirection.endToStart,
            key: ValueKey(favoriteList[index].id),
            child: Card(
              color: Colors.teal[300],
              clipBehavior: Clip.hardEdge,
              child: Row(
                children: [
                  IntrinsicHeight(
                    child: Image.network(
                      favoriteList[index].thumbnail,
                      width: Get.width * 0.4,
                      height: Get.height * 0.22,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  IntrinsicHeight(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Wrap(
                            children: [
                              Card(
                                color: Color(kCategoryBackgroundColor[
                                    favoriteList[index].category]!),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    favoriteList[index].category.tr,
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
                                    favoriteList[index].brand.tr,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              buildProductCardTitleRating(
                                context,
                                favoriteList,
                                index,
                              ),
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
                                  "${'Stock'.tr}: ${favoriteList[index].stock.toString()}",
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
                                  "${'Price'.tr}: \$${favoriteList[index].price.toString()}",
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
        ),
      ),
    );
  }
}
