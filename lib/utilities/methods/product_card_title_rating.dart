import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../service/model/products_model.dart';

Column buildProductCardTitleRating(
    BuildContext context, List<Product> productListGetX, int index) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.27,
        child: Text(
          productListGetX[index].title,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            productListGetX[index].rating.toString(),
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            width: 10,
          ),
          RatingBarIndicator(
            rating: productListGetX[index].rating,
            itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemCount: 5,
            itemSize: 15.0,
            direction: Axis.horizontal,
          ),
        ],
      ),
    ],
  );
}
