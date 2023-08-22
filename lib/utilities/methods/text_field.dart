import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../get_x/state/product_list_get_x.dart';

Expanded buildTextField(
    ProductList getController, TextEditingController searchController) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Get.isDarkMode ? Colors.grey : Colors.grey[300],
          borderRadius: BorderRadiusDirectional.circular(12),
        ),
        height: 50,
        width: double.infinity,
        child: TextField(
          onSubmitted: (value) {
            getController.searchedList(value);
          },
          controller: searchController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 10, top: 15),
            border: InputBorder.none,
            suffixIcon: IconButton(
              onPressed: () {
                getController.searchedList(searchController.text);
              },
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
            hintText: '  search products'.tr,
          ),
        ),
      ),
    ),
  );
}
