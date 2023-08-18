import 'package:codelandia_team_work_ecommerce/widgets/category_card.dart';
import 'package:codelandia_team_work_ecommerce/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../get_x/state/product_list_get_x.dart';

ScrollController scrollController = ScrollController();

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductList getController = Get.put(ProductList());

    TextEditingController searchController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {},
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://images.yourstory.com/cs/2/96eabe90392211eb93f18319e8c07a74/Imagejtb7-1684960500563.jpg'),
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
                        Get.bottomSheet(
                          Container(
                            width: Get.width,
                            height: Get.height / 2,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
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
                        onPressed: () {},
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
                      color: Colors.grey[300],
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Container(
                          color: Colors.grey[500],
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
                color: Colors.grey[300],
                child: ProductCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildTextField(
      ProductList getController, TextEditingController searchController) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadiusDirectional.circular(12),
          ),
          height: 50,
          width: double.infinity,
          child: TextField(
            onChanged: (value) {
              getController.searchedList(value);
            },
            controller: searchController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 10, top: 15),
              border: InputBorder.none,
              suffixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              hintText: '  search products'.tr,
            ),
          ),
        ),
      ),
    );
  }
}
