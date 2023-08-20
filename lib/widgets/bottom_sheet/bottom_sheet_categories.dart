import 'package:codelandia_team_work_ecommerce/utilities/constants/category_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../get_x/state/category_filter_list.dart';

class BottomSheetCategories extends StatefulWidget {
  const BottomSheetCategories({super.key});

  @override
  State<BottomSheetCategories> createState() => _BottomSheetCategoriesState();
}

class _BottomSheetCategoriesState extends State<BottomSheetCategories> {
  CategoryFilter categoryFilterGetController = Get.put(CategoryFilter());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: kCategoriesList.length,
            itemBuilder: (context, index) {
              return Obx(() {
                return CheckboxListTile(
                  value:
                      categoryFilterGetController.categoryFilterList.contains(
                    kCategoriesList[index],
                  ),
                  title: Text(kCategoriesList[index].tr),
                  onChanged: (value) {
                    setState(
                      () {
                        if (!categoryFilterGetController.categoryFilterList
                            .contains(kCategoriesList[index])) {
                          categoryFilterGetController.categoryFilterList
                              .add(kCategoriesList[index].toLowerCase());
                        } else {
                          categoryFilterGetController.categoryFilterList
                              .remove(kCategoriesList[index]);
                        }
                      },
                    );
                  },
                );
              });
            },
          ),
        ),
      ],
    );
  }
}
