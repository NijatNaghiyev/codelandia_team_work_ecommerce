import 'package:codelandia_team_work_ecommerce/service/api/products_api.dart';
import 'package:get/get.dart';

import '../../service/model/products_model.dart';

class ProductList extends GetxController {
  RxList<Product> productListGetX = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  /// Get data to list
  void getData() {
    fetchProducts().then((value) => productListGetX.value = value);
  }

  /// To filter list
  void filteredList({
    int minPrice = 0,
    int maxPrice = 9999999,
    double minRating = 1,
    List<String> category = const [],
  }) {
    productListGetX.value = productListGetX
        .where(
          (element) => category.isEmpty
              ? (minPrice < element.price && element.price < maxPrice) &&
                  (minRating < element.rating)
              : (minPrice < element.price && element.price < maxPrice) &&
                  (minRating < element.rating) &&
                  (category.contains(element.category)),
        )
        .toList();
  }

  /// To search for product's title
  void searchedList(String name) {
    if (name.trim().length >= 3) {
      productListGetX.value = productListGetX
          .where(
            (element) =>
                element.title.toLowerCase().contains(name.trim().toLowerCase()),
          )
          .toList();
    } else {
      fetchProducts().then((value) => productListGetX.value = value);
    }
  }
}
