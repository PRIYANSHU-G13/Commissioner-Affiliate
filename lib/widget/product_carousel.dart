import 'package:commissioner_affiliate_1/models/models.dart';
import 'package:commissioner_affiliate_1/widget/widget.dart';
import 'package:flutter/material.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  const ProductCarousel({
    required this.products,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          scrollDirection: Axis.horizontal,
          itemCount: Product.products.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ProductCard(products: products[index]),
            );
          }
      ),
    );
  }
}
