import 'package:codelandia_team_work_ecommerce/get_x/state/category_filter_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utilities/constants/color.dart';
import 'bottom_sheet.dart';

class BottomSheetFiltersContainer extends StatelessWidget {
  const BottomSheetFiltersContainer({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: selectedFilter == text
          ? Get.isDarkMode
              ? kDarkModeColor
              : Colors.white
          : Colors.transparent,
      width: Get.width * 0.4,
      height: 60,
      child: Center(
        child: Text(
          text.tr,
          textAlign: TextAlign.center,
          style: GoogleFonts.caveat(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
