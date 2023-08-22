import '../../screens/cart_screen.dart';

double getTotalPrice() {
  return allProducts.productListGetX.fold(
    0.0,
    (previousValue, element) {
      if (cartsId.cartList.contains(element.id)) {
        return previousValue +
            element.price *
                (100 - element.discountPercentage) /
                100 *
                cartsId.cartList.where((e) => e == element.id).length;
      }
      return previousValue;
    },
  );
}
