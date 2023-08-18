import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

class FavoriteList extends GetxController {
  RxList<int> favoriteList = <int>[].obs;
  // final favoriteList = RxList<int>();
  @override
  void onInit() {
    super.onInit();
    favoriteList.value = Hive.box('favoriteListBox').get('favoriteList') ?? [];
  }
}
