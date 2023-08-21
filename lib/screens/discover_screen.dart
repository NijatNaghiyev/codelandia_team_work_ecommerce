import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:codelandia_team_work_ecommerce/widgets/category_card.dart';
import 'package:codelandia_team_work_ecommerce/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../get_x/state/product_list_get_x.dart';
import '../utilities/methods/text_field.dart';
import '../widgets/bottom_sheet/bottom_sheet.dart';
import 'category_grid_card.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({
    super.key,
  });

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

ScrollController scrollController = ScrollController();

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    void openNewPage(BuildContext context) {
      int index = 0;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryGridCard(
            index: index,
          ),
        ),
      );
    }

    ProductList getController = Get.put(ProductList());

    TextEditingController searchController = TextEditingController();

    getController.getData();
    return SafeArea(
      child: SingleChildScrollView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'discover'.tr,
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildTextField(getController, searchController),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      showFlexibleBottomSheet(
                        bottomSheetBorderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        minHeight: 0,
                        initHeight: 0.5,
                        maxHeight: 1,
                        anchors: [0, 0.5, 1],
                        isSafeArea: true,
                        context: context,
                        builder:
                            (context, scrollController, bottomSheetOffset) {
                          return BottomSheetWidget(
                            scrollController: scrollController,
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Get.isDarkMode ? Colors.grey : Colors.grey[300],
                        borderRadius: BorderRadiusDirectional.circular(12),
                      ),
                      width: 50,
                      height: 50,
                      child: const Icon(
                        Icons.filter_list,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'categories'.tr,
                        style: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        openNewPage(context);
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  height: 160,
                  child: CategoryCard(),
                ),
              ],
            ),
            const SizedBox(height: 10),
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
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'all'.tr,
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: Get.width,
              color: Get.isDarkMode ? Colors.grey : Colors.grey[300],
              child: GetBuilder<ProductList>(
                builder: (controller) => const ProductCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
