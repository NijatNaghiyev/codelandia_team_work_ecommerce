import 'package:carousel_slider/carousel_slider.dart';
import 'package:codelandia_team_work_ecommerce/hive/favorite_list_hive.dart';
import 'package:codelandia_team_work_ecommerce/service/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
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
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            onPressed: () {},
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
                    Text(
                      widget.product.category,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    Text(
                      widget.product.title,
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.w500),
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
                              activeDotColor: Colors.orange),
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
                          color: Colors.orange,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/images/BRCB_BLACK_4075d6b0c8.png",
                            width: MediaQuery.sizeOf(context).width / 4,
                          ),
                          Image.asset(
                            "assets/images/download.jpg",
                            width: MediaQuery.sizeOf(context).width / 4,
                          ),
                          Image.asset(
                            "assets/images/download.png",
                            width: MediaQuery.sizeOf(context).width / 4,
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
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_outlined),
                  color: Colors.orange,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
