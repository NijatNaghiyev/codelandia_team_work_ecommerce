import 'package:codelandia_team_work_ecommerce/get_x/state/category_filter_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/bottom_sheet/bottom_sheet_ratings.dart';
import '../constants/color.dart';

Container buildBottomSheetAppBar(BuildContext context) {
  CategoryFilter categoryFilterGetController = Get.put(CategoryFilter());
  return Container(
    color: Get.isDarkMode ? kDarkModeColor : Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(
              'Filters'.tr.toUpperCase(),
              style: GoogleFonts.caveat(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
              categoryFilterGetController.categoryFilterList.clear();
              selectedRating = 1;
            },
          )
        ],
      ),
    ),
  );
}
