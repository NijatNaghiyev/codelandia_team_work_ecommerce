import 'package:dio/dio.dart';

import '../model/products_model.dart';

enum Url { products }

const String baseUrl = 'https://dummyjson.com/';
Future<List<Product>> fetchProducts() async {
  try {
    var response = await Dio().get(baseUrl + Url.products.name);
    if (response.statusCode == 200) {
      var jsonData = response.data["products"] as List;
      return jsonData.map((e) => Product.fromJson(e)).toList();
    }
  } catch (e) {
    // ignore: avoid_print
    print('Dio xeta: $e');
  }
  return [];
}
