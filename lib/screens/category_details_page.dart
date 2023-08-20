import 'package:codelandia_team_work_ecommerce/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../get_x/state/product_list_get_x.dart';
import '../utilities/constants/category_constants.dart';

ProductList getController = Get.put(ProductList());

class CategoryDetailsPage extends StatelessWidget {
  final String category;
  final String imageUrl;
  final int index;
  final Map backgroundColor;

  const CategoryDetailsPage({
    super.key,
    required this.category,
    required this.imageUrl,
    required this.index,
    required this.backgroundColor,
  });

  void _onBackPressed(BuildContext context) {
    getController.getData();
    Navigator.pop(context);
  }

  void _showShoppingBag(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.transparent,
          padding: const EdgeInsets.all(16.0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Shopping Bag',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              // You can add your shopping bag items or any other relevant content here
              // Example:
              Text('Item 1'),
              Text('Item 2'),
              Text('Item 3'),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Color bgColor = Color(backgroundColor[category]);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => _onBackPressed(context),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            category.toUpperCase(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
        actions: [
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.shopping_bag),
            onPressed: () {
              // _showShoppingBag(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: IntrinsicHeight(
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            categoryDescriptions[category]!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: IntrinsicHeight(
                        child: AspectRatio(
                          aspectRatio: 3 / 5,
                          child: Card(
                            clipBehavior: Clip.hardEdge,
                            shadowColor: Colors.white,
                            child: Image.network(
                              imageUrl,
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  height: 80,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Get.isDarkMode ? Colors.grey : Colors.grey[300],
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        color: Get.isDarkMode
                            ? Colors.grey[300]
                            : Colors.grey[500],
                        height: 5,
                        width: 35,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: Get.width,
              color: Get.isDarkMode ? Colors.grey : Colors.grey[300],
              child: const ProductCard(),
            ),
          ],
        ),
      ),
      backgroundColor: Color(
        backgroundColor[category],
      ),
    );
  }
}
