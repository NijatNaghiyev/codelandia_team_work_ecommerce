import 'package:codelandia_team_work_ecommerce/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/category_constants.dart';
import '../get_x/state/product_list_get_x.dart';

class CategoryDetailsPage extends StatelessWidget {
  final String category;
  final String imageUrl;
  final int index;
  final Map backgroundColor;
  ProductList getController = Get.put(ProductList());

  CategoryDetailsPage({
    super.key,
    required this.category,
    required this.imageUrl,
    required this.index,
    required this.backgroundColor,
  });

  void _onBackPressed(BuildContext context) {
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
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
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
            color: Colors.black,
            icon: const Icon(Icons.shopping_bag),
            onPressed: () {
              _showShoppingBag(context); // Show bottom sheet
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: bgColor.withOpacity(0.7),
                  ),
                  child: Text(
                    categoryDescriptions[category]!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: category,
                    child: Image.network(
                      imageUrl,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(child: ProductCard()),
        ],
      ),
      backgroundColor: Color(backgroundColor[category]),
    );
  }
}
