import 'package:codelandia_team_work_ecommerce/get_x/state/product_list_get_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../hive/favorite_list_hive.dart';
import '../screens/discover_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    ProductList getController = Get.put(ProductList());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: Get.height * 0.4,
          minWidth: Get.width,
        ),
        child: Obx(() {
          return GridView.builder(
            controller: scrollController,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: getController.productListGetX.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) => Container(
              clipBehavior: Clip.hardEdge,
              width: MediaQuery.sizeOf(context).width * 0.4,
              height: MediaQuery.sizeOf(context).height * 0.17,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Image.network(
                      getController.productListGetX[index].images.last,
                      height: Get.height * 0.1,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.27,
                              child: Text(
                                getController.productListGetX[index].title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  getController.productListGetX[index].rating
                                      .toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                RatingBarIndicator(
                                  rating: getController
                                      .productListGetX[index].rating,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 15.0,
                                  direction: Axis.horizontal,
                                ),
                              ],
                            ),
                          ],
                        ),

                        Obx(() {
                          return IconButton(
                            onPressed: () {
                              putAndRemoveFavoriteList(
                                  getController.productListGetX[index].id);
                              // print(getController.productListGetX[index].id);
                              // print(isFavorite(
                              //         getController.productListGetX[index].id)
                              //     .toString());
                            },
                            icon: Icon(
                              isFavorite(
                                      getController.productListGetX[index].id)
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: Colors.red,
                            ),
                          );
                        }),
                        // TextButton(
                        //   onPressed: () {
                        //     setState(() {
                        //       isFavorite = !isFavorite;
                        //     });
                        //   },
                        //   child: Text(
                        //     "${isFavorite ? "Remove from" : "Add to"} favorite",
                        //     style: TextStyle(
                        //         color: isFavorite ? Colors.red : Colors.blue),
                        //     textAlign: TextAlign.center,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "\$${getController.productListGetX[index].price}",
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
