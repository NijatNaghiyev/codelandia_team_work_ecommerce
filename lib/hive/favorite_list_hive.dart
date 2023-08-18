import 'package:codelandia_team_work_ecommerce/get_x/state/favorite_list_get_x.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

FavoriteList favoriteListController = Get.put(FavoriteList());

void putAndRemoveFavoriteList(int id) {
  if (favoriteListController.favoriteList.contains(id)) {
    favoriteListController.favoriteList.remove(id);
  } else {
    favoriteListController.favoriteList.add(id);
  }
  Hive.box('favoriteListBox')
      .put('favoriteList', favoriteListController.favoriteList);
}

bool isFavorite(int id) {
  return favoriteListController.favoriteList.contains(id);
}

void clearFavoriteList() {
  favoriteListController.favoriteList.clear();
  Hive.box('favoriteListBox')
      .put('favoriteList', favoriteListController.favoriteList);
}
