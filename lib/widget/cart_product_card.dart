import 'package:commissioner_affiliate_1/blocs/cart/cart_bloc.dart';
import 'package:commissioner_affiliate_1/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;

  const CartProductCard({Key? key, required this.product, required this.quantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            product.imageUrl, height: 80, width: 100, fit: BoxFit.cover,),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: TextStyle(
                  color: Color(0xff303030),
                  fontSize: 16,
                  fontFamily: "Semplicita",
                  fontWeight: FontWeight.w800,
                ),),
                Text('Rs.${product.price}', style: TextStyle(
                  color: Color(0xff303030),
                  fontSize: 14,
                  fontFamily: "Semplicita",
                  fontWeight: FontWeight.w600,
                ),),
              ],
            ),
          ),
          SizedBox(width: 10,),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Row(
                children: [
                  IconButton(onPressed: () {
                    context.read<CartBloc>().add(CartProductAdded(product));
                  }, icon: Icon(Icons.add_circle)),
                  Text(
                    "$quantity",
                    style: TextStyle(
                      color: Color(0xff303030),
                      fontSize: 16,
                      fontFamily: "Semplicita",
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.90,
                    ),
                  ),
                  IconButton(onPressed: () {context.read<CartBloc>().add(CartProductRemoved(product));}, icon: Icon(Icons.remove_circle)),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}