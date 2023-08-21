import 'package:codelandia_team_work_ecommerce/get_x/state/cart_list_get_x.dart';
import 'package:codelandia_team_work_ecommerce/service/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartCard extends StatefulWidget {
  final Product product;
  const CartCard({super.key, required this.product});

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  CartList cartListController = Get.put(CartList());
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {});
                  cartListController.cartList
                      .removeWhere((element) => element == widget.product.id);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.teal,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                widget.product.images[0],
                height: 200,
                width: MediaQuery.sizeOf(context).width * 0.75,
                fit: BoxFit.contain,
              ),
            ],
          ),
          Text(
            widget.product.title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\$${widget.product.price}",
                    style: TextStyle(
                      decoration: TextDecoration.combine([
                        TextDecoration.lineThrough,
                      ]),
                      decorationThickness: 2.0,
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "\$${widget.product.price - (widget.product.price / 100 * widget.product.discountPercentage).round()}",
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 50),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      if (cartListController.cartList
                              .where((element) => element == widget.product.id)
                              .toList()
                              .length >
                          1) {
                        setState(() {
                          cartListController.cartList.remove(widget.product.id);
                        });
                      }
                    },
                    child: const Text(
                      "-",
                      style: TextStyle(
                        fontSize: 45,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 5,
                        color: Colors.teal,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      cartListController.cartList
                          .where((e) => e == widget.product.id)
                          .toList()
                          .length
                          .toString(),
                      style: const TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        cartListController.cartList.add(widget.product.id);
                      });
                    },
                    child: const Text(
                      "+",
                      style: TextStyle(
                        fontSize: 45,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
