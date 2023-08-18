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
    double maxRating = 5,
    List<String> category = const [],
  }) {
    fetchProducts().then((value) => productListGetX.value = value
        .where(
          (element) => category.isEmpty
              ? (minPrice < element.price && element.price < maxPrice) &&
                  (minRating < element.rating && element.rating < maxRating)
              : (minPrice < element.price && element.price < maxPrice) &&
                  (minRating < element.rating && element.rating < maxRating) &&
                  (category.contains(element.category)),
        )
        .toList());
  }

  /// To search for product's title
  void searchedList(String name) {
    if (name.trim().length >= 3) {
      fetchProducts().then((value) => productListGetX.value = value
          .where(
            (element) =>
                element.title.toLowerCase().contains(name.trim().toLowerCase()),
          )
          .toList());
    } else {
      fetchProducts().then((value) => productListGetX.value = value);
    }
  }
}