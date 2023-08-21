// ignore_for_file: prefer_const_constructors

import 'package:codelandia_team_work_ecommerce/get_x/state/category_filter_list.dart';
import 'package:codelandia_team_work_ecommerce/get_x/state/product_list_get_x.dart';
import 'package:codelandia_team_work_ecommerce/widgets/bottom_sheet/bottom_sheet_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utilities/constants/color.dart';
import '../../utilities/methods/bottom_sheet_app_bar.dart';
import 'bottom_sheet_categories.dart';
import 'bottom_sheet_filters_container.dart';
import 'bottom_sheet_ratings.dart';

String selectedFilter = 'categories';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

Widget activeFilter = const BottomSheetCategories();
TextEditingController minPriceController = TextEditingController();
TextEditingController maxPriceController = TextEditingController();

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    TextEditingController ratingController = TextEditingController();
    ProductList productlistController = Get.put(ProductList());
    CategoryFilter categoryFilterGetController = Get.put(CategoryFilter());
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? kDarkModeColor : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        controller: widget.scrollController,
        child: Column(
          children: [
            buildBottomSheetAppBar(context),
            Divider(
              height: 0,
              thickness: 2,
              color: Get.isDarkMode ? Colors.grey : kDarkModeColor,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: Get.width * 0.4,
                  height: Get.height * 0.78,
                  color: Colors.teal[200],
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const BottomSheetFiltersContainer(text: 'Department'),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedFilter = 'categories';
                            activeFilter = const BottomSheetCategories();
                          });
                        },
                        child: BottomSheetFiltersContainer(
                          text: 'categories',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedFilter = 'prices';
                            activeFilter = const BottomSheetPrice();
                          });
                        },
                        child: BottomSheetFiltersContainer(
                          text: 'prices',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedFilter = 'Ratings';
                            activeFilter = const BottomSheetRatings();
                          });
                        },
                        child: BottomSheetFiltersContainer(
                          text: 'Ratings',
                        ),
                      ),
                      const BottomSheetFiltersContainer(text: 'Size'),
                      const BottomSheetFiltersContainer(text: 'Color'),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.78,
                  width: Get.width * 0.6,
                  child: activeFilter,
                ),
              ],
            ),
            BottomSheetBottomBar(
                categoryFilterGetController,
                maxPriceController,
                minPriceController,
                ratingController,
                productlistController),
          ],
        ),
      ),
    );
  }

  Row BottomSheetBottomBar(
      CategoryFilter categoryFilterGetController,
      TextEditingController maxPriceController,
      TextEditingController minPriceController,
      TextEditingController ratingController,
      ProductList productlistController) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              selectedRating = 1;
              categoryFilterGetController.categoryFilterList.clear();
              maxPriceController.clear();
              minPriceController.clear();
              ratingController.clear();
            });
          },
          child: Container(
            color: Get.isDarkMode ? kDarkModeColor : Colors.white,
            width: Get.width * 0.4,
            height: Get.height * 0.1,
            child: Center(
              child: Text(
                'Clear all'.tr.toUpperCase(),
                style: GoogleFonts.caveat(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {});
            Get.back();
            productlistController.filteredList(
              minPrice: int.tryParse(minPriceController.text) ?? 0,
              maxPrice: int.tryParse(maxPriceController.text) ?? 999999,
              minRating: selectedRating,
              category: [...categoryFilterGetController.categoryFilterList],
            );
            categoryFilterGetController.categoryFilterList.clear();
            selectedRating = 1;
            minPriceController.clear();
            maxPriceController.clear();
            errorMin = false;
            errorMax = false;
          },
          child: Container(
            color: Colors.redAccent,
            width: Get.width * 0.6,
            height: Get.height * 0.1,
            child: Center(
              child: Text(
                'Apply filters'.tr.toUpperCase(),
                style: GoogleFonts.caveat(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
