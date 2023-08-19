import 'package:codelandia_team_work_ecommerce/get_x/state/favorite_list_get_x.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

FavoriteList favoriteListController = Get.put(FavoriteList());

void putAndRemoveFavoriteList(int id) {
  if (favoriteListController.cartList.contains(id)) {
    favoriteListController.cartList.remove(id);
  } else {
    favoriteListController.cartList.add(id);
  }
  Hive.box('favoriteListBox')
      .put('favoriteList', favoriteListController.cartList);
}

bool isFavorite(int id) {
  return favoriteListController.cartList.contains(id);
}

void clearFavoriteList() {
  favoriteListController.cartList.clear();
  Hive.box('favoriteListBox')
      .put('favoriteList', favoriteListController.cartList);
}
