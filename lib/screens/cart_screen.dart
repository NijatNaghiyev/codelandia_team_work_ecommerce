import 'package:codelandia_team_work_ecommerce/get_x/state/cart_list_get_x.dart';
import 'package:codelandia_team_work_ecommerce/get_x/state/product_list_get_x.dart';
import 'package:codelandia_team_work_ecommerce/screens/order_screen.dart';
import 'package:codelandia_team_work_ecommerce/service/model/products_model.dart';
import 'package:codelandia_team_work_ecommerce/widgets/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartList cartsId = Get.put(CartList());
    ProductList allProducts = Get.put(ProductList());
    List<Product> selectedProducts = allProducts.productListGetX
        .where((i) => cartsId.cartList.contains(i.id))
        .toList();

    return Scaffold(
      body: Container(
        color: Get.isDarkMode ? Colors.grey : Colors.grey[300],
        child: GridView.builder(
          itemCount: selectedProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) =>
              CartCard(product: selectedProducts[index]),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Obx(() {
            return Text(
              "Total price: \n${(allProducts.productListGetX.fold(0, (previousValue, element) {
                    if (cartsId.cartList.contains(element.id)) {
                      return previousValue +
                          element.price *
                              cartsId.cartList
                                  .where((e) => e == element.id)
                                  .length;
                    }
                    return previousValue;
                  }).toDouble() * 0.9).toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.teal,
                fontWeight: FontWeight.w600,
              ),
            );
          }),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const OrderScreen()));
            },
            child: const Text(
              "Order",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      )),
    );
  }
}
