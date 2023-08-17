import 'package:codelandia_team_work_ecommerce/get_x/state/product_list_get_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../hive/favorite_list_hive.dart';
import '../screens/discover_screen.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavoriteBool = false;

  @override
  Widget build(BuildContext context) {
    ProductList getController = Get.put(ProductList());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 3100,
        width: Get.width,
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
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Image.network(
                        getController.productListGetX[index].images.last,
                        // width: MediaQuery.sizeOf(context).width * 0.15,
                        height: Get.height * 0.1,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Row(
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
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            RatingBarIndicator(
                              rating:
                                  getController.productListGetX[index].rating,
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
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isFavoriteBool = !isFavoriteBool;
                            });
                          },
                          icon: Icon(
                            isFavorite(1)
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: Colors.red,
                          ),
                        ),
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
                    Text(
                      "\$${getController.productListGetX[index].price}",
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
