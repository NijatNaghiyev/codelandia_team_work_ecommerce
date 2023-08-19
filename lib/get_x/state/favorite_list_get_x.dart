import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

class FavoriteList extends GetxController {
  RxList<int> cartList = <int>[].obs;
  // final favoriteList = RxList<int>();
  @override
  void onInit() {
    super.onInit();
    cartList.value = Hive.box('favoriteListBox').get('favoriteList') ?? [];
  }
}
