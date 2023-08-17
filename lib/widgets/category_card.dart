import 'package:codelandia_team_work_ecommerce/constants/category_constants.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../get_x/state/product_list_get_x.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ProductList getController = Get.put(ProductList());
    return SizedBox(
      height: MediaQuery.of(context).size.height / 5,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: kCategoriesList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {},
            child: SizedBox(
              height: 200,
              width: 200,
              child: Card(
                clipBehavior: Clip.hardEdge,
                margin: const EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color(kCategoryBackgroundColor[
                              kCategoriesList[index]]!)),
                    ),
                    Positioned.fill(
                      child: FancyShimmerImage(
                        imageUrl: kCategoryImages[kCategoriesList[index]]!,
                        boxFit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Color(kCategoryBackgroundColor[
                                kCategoriesList[index]]!)
                            .withOpacity(0.7),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: Center(
                          child: Text(
                            kCategoriesList[index].tr.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
