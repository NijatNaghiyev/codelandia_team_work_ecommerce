import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

class CartList extends GetxController {
  RxList<int> cartList = <int>[].obs;
  @override
  void onInit() {
    super.onInit();
    cartList.value = Hive.box('cartListBox').get('cartList') ?? [];
    print(cartList);
  }
}
