import 'package:carousel_slider/carousel_slider.dart';
import 'package:codelandia_team_work_ecommerce/hive/cart_list_hive.dart';
import 'package:codelandia_team_work_ecommerce/hive/favorite_list_hive.dart';
import 'package:codelandia_team_work_ecommerce/service/model/products_model.dart';
import 'package:codelandia_team_work_ecommerce/utilities/constants/category_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  const ProductScreen({super.key, required this.product});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            onPressed: () {
              Get.closeCurrentSnackbar();
              Get.showSnackbar(
                GetSnackBar(
                  backgroundColor: Colors.teal,
                  duration: const Duration(seconds: 3),
                  message: 'Copy to clipboard'.tr,
                ),
              );
            },
            icon: const Icon(Icons.share),
          ),
          Obx(() {
            return IconButton(
              onPressed: () {
                putAndRemoveFavoriteList(widget.product.id);
              },
              icon: Icon(
                isFavorite(widget.product.id)
                    ? Icons.favorite
                    : Icons.favorite_outline,
                color:
                    isFavorite(widget.product.id) ? Colors.red : Colors.white,
              ),
            );
          }),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      color: Color(
                          kCategoryBackgroundColor[widget.product.category]!),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          widget.product.category.tr,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      widget.product.title,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        CarouselSlider.builder(
                          options: CarouselOptions(
                            height: 200,
                            autoPlay: true,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) =>
                                setState(() => activeIndex = index),
                          ),
                          itemCount: widget.product.images.length,
                          itemBuilder:
                              (BuildContext context, int index, int realIndex) {
                            return Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              color: Colors.grey,
                              child: Image.network(
                                widget.product.images[index],
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AnimatedSmoothIndicator(
                          activeIndex: activeIndex,
                          count: widget.product.images.length,
                          effect: const JumpingDotEffect(
                              dotWidth: 20,
                              dotHeight: 8,
                              activeDotColor: Colors.teal),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                      widget.product.description,
                      style: const TextStyle(fontSize: 24),
                    ),
                    Row(
                      children: [
                        Text(
                          widget.product.rating.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        RatingBarIndicator(
                          rating: widget.product.rating,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 30.0,
                          direction: Axis.horizontal,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 5,
                          color: Colors.teal,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                "assets/images/BRCB_BLACK_4075d6b0c8.png",
                                width: MediaQuery.sizeOf(context).width / 4,
                              ),
                              Text(
                                "\$${((widget.product.price - (widget.product.price / 100 * widget.product.discountPercentage)) / 24).toStringAsFixed(2)} x 24",
                                style: const TextStyle(fontSize: 25),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                "assets/images/download.jpg",
                                width: MediaQuery.sizeOf(context).width / 4,
                              ),
                              Text(
                                "\$${((widget.product.price - (widget.product.price / 100 * widget.product.discountPercentage)) / 18).toStringAsFixed(2)} x 18",
                                style: const TextStyle(fontSize: 25),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                "assets/images/download.png",
                                width: MediaQuery.sizeOf(context).width / 4,
                              ),
                              Text(
                                "\$${((widget.product.price - (widget.product.price / 100 * widget.product.discountPercentage)) / 12).toStringAsFixed(2)} x 12",
                                style: const TextStyle(fontSize: 25),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\$${widget.product.price}",
                      style: TextStyle(
                        decoration: TextDecoration.combine([
                          TextDecoration.lineThrough,
                        ]),
                        decorationThickness: 2.0,
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "\$${widget.product.price - (widget.product.price / 100 * widget.product.discountPercentage).round()}",
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),
                Obx(
                  () {
                    return IconButton(
                      onPressed: () {
                        putAndRemoveCartList(widget.product.id);
                      },
                      icon: Icon(isCart(widget.product.id)
                          ? Icons.shopping_cart
                          : Icons.shopping_cart_outlined),
                      color: Colors.teal,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
