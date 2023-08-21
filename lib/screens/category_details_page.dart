import 'package:codelandia_team_work_ecommerce/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../get_x/state/product_list_get_x.dart';
import '../utilities/constants/category_constants.dart';

ProductList getController = Get.put(ProductList());

class CategoryDetailsPage extends StatefulWidget {
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

  @override
  State<CategoryDetailsPage> createState() => _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends State<CategoryDetailsPage> {
  void _onBackPressed(BuildContext context) {
    getController.getData();
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    getController.filteredList(category: [kCategoriesList[widget.index]]);
  }

  @override
  Widget build(BuildContext context) {
    Color bgColor = Color(widget.backgroundColor[widget.category]);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => _onBackPressed(context),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          widget.category.toUpperCase(),
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
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
                            categoryDescriptions[widget.category]!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(
                        widget.imageUrl,
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
      backgroundColor: bgColor,
    );
  }
}
