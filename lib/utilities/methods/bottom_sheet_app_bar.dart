import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/color.dart';

Container buildBottomSheetAppBar(BuildContext context) {
  return Container(
    color: Get.isDarkMode ? kDarkModeColor : Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            'Filters'.tr.toUpperCase(),
            style: GoogleFonts.caveat(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    ),
  );
}
