import 'package:codelandia_team_work_ecommerce/get_x/state/cart_list_get_x.dart';
import 'package:codelandia_team_work_ecommerce/get_x/state/product_list_get_x.dart';
import 'package:codelandia_team_work_ecommerce/screens/order_screen.dart';
import 'package:codelandia_team_work_ecommerce/widgets/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../generated/assets.dart';
import '../utilities/methods/get_total_price.dart';

CartList cartsId = Get.put(CartList());
ProductList allProducts = Get.put(ProductList());

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                            "${"Total price".tr}: \n${'\$${getTotalPrice().round()}'}",
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
                              builder: (context) => OrderScreen(
                                totalPrice: getTotalPrice().round(),
                              ),
                            ),
                          );
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
