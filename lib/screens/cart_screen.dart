import 'package:codelandia_team_work_ecommerce/get_x/state/cart_list_get_x.dart';
import 'package:codelandia_team_work_ecommerce/get_x/state/product_list_get_x.dart';
import 'package:codelandia_team_work_ecommerce/screens/order_screen.dart';
import 'package:codelandia_team_work_ecommerce/service/model/products_model.dart';
import 'package:codelandia_team_work_ecommerce/widgets/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../generated/assets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartList cartsId = Get.put(CartList());
    ProductList allProducts = Get.put(ProductList());

    return Scaffold(
      body: Container(
        color: Get.isDarkMode ? Colors.grey : Colors.grey[300],
        child: cartsId.cartList.isEmpty
            ? Center(
                child: Lottie.asset(Assets.lottieNotFound),
              )
            : Obx(() {
                return GridView.builder(
                  itemCount: allProducts.productListGetX
                      .where((e) => cartsId.cartList.contains(e.id))
                      .toList()
                      .length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) => CartCard(
                      product: allProducts.productListGetX
                          .where((e) => cartsId.cartList.contains(e.id))
                          .toList()[index]),
                );
              }),
      ),
      bottomNavigationBar: Obx(
        () {
          return cartsId.cartList.isEmpty
              ? SizedBox()
              : BottomAppBar(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Obx(
                        () {
                          return Text(
                            "${"Total price".tr}: \n${'\$${(allProducts.productListGetX.fold(
                              0.0,
                              (previousValue, element) {
                                if (cartsId.cartList.contains(element.id)) {
                                  return previousValue +
                                      element.price *
                                          (100 - element.discountPercentage) /
                                          100 *
                                          cartsId.cartList
                                              .where((e) => e == element.id)
                                              .length;
                                }
                                return previousValue;
                              },
                            )).toStringAsFixed(2)}'}",
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.teal,
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OrderScreen()));
                        },
                        child: Text(
                          "Order".tr,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
