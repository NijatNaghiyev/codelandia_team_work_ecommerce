import 'package:codelandia_team_work_ecommerce/get_x/state/favorite_list_get_x.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../get_x/state/cart_list_get_x.dart';

CartList cartListController = Get.put(CartList());

void putAndRemoveCartList(int id) {
  if (cartListController.cartList.contains(id)) {
    cartListController.cartList.remove(id);
  } else {
    cartListController.cartList.add(id);
  }
  Hive.box('cartListBox').put('cartList', cartListController.cartList);
}

bool isCart(int id) {
  return cartListController.cartList.contains(id);
}

void clearCartList() {
  cartListController.cartList.clear();
  Hive.box('cartListBox').put('cartList', cartListController.cartList);
}
