import 'package:codelandia_team_work_ecommerce/get_x/state/product_list_get_x.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../get_x/state/favorite_list_get_x.dart';
import '../hive/dark_mode.dart';
import '../hive/favorite_list_hive.dart';
import '../widgets/category_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductList getController = Get.put(ProductList());
    FavoriteList favoriteListController = Get.put(FavoriteList());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'discover'.tr,
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.yourstory.com/cs/2/96eabe90392211eb93f18319e8c07a74/Imagejtb7-1684960500563.jpg'),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          CategoryCard(),
          Obx(() {
            return getController.productListGetX.isNotEmpty
                ? SizedBox(
                    height: Get.height / 4,
                    child: ListView.builder(
                      itemCount: getController.productListGetX.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title:
                              Text(getController.productListGetX[index].title),
                          subtitle: Text(
                              getController.productListGetX[index].description),
                          leading: CircleAvatar(
                            child: Text(getController.productListGetX[index].id
                                .toString()),
                          ),
                          trailing: Obx(
                            () {
                              return IconButton(
                                onPressed: () {
                                  putAndRemoveFavoriteList(
                                      getController.productListGetX[index].id);
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: isFavorite(getController
                                          .productListGetX[index].id)
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  )
                : const CircularProgressIndicator();
          }),
          Obx(() {
            return SizedBox(
              height: Get.height / 4,
              child: ListView.builder(
                itemCount: favoriteListController.favoriteList.length,
                itemBuilder: (context, index) => Text(
                  favoriteListController.favoriteList[index].toString(),
                ),
              ),
            );
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        changeTheme();
      }),
    );
  }
}
