// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:codelandia_team_work_ecommerce/get_x/state/product_list_get_x.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController minPriceController = TextEditingController();
    TextEditingController maxPriceController = TextEditingController();
    TextEditingController ratingController = TextEditingController();
    ProductList productlistController = Get.put(ProductList());
    return Container(
      width: Get.width,
      height: Get.height / 2,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? Colors.grey : Colors.grey[300],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Filters'.tr,
            style:
                GoogleFonts.openSans(fontWeight: FontWeight.w400, fontSize: 32),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: minPriceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Minimum Price'.tr),
                        hintText: '0',
                        prefixText: '\$'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: maxPriceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Maximum Price'.tr,
                        hintText: '99999',
                        prefixText: '\$'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: ratingController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Rating'.tr,
                      hintText: '1',
                      prefixIcon: Icon(Icons.star_rate),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'or more ratings'.tr,
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
              productlistController.filteredList(
                minPrice: int.tryParse(minPriceController.text) ?? 0,
                maxPrice: int.tryParse(maxPriceController.text) ?? 999999,
                minRating: double.tryParse(ratingController.text) ?? 1,
              );
            },
            child: Text(
              'Submit'.tr,
              style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
