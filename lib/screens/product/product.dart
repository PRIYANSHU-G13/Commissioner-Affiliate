import 'package:carousel_slider/carousel_slider.dart';
import 'package:commissioner_affiliate_1/blocs/cart/cart_bloc.dart';
import 'package:commissioner_affiliate_1/blocs/wishlist/wishlist_bloc.dart';
import 'package:commissioner_affiliate_1/models/cart_model.dart';
import 'package:commissioner_affiliate_1/models/cart_model.dart';
import 'package:commissioner_affiliate_1/models/models.dart';
import 'package:commissioner_affiliate_1/widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => ProductScreen(product: product),
    );
  }

  final Product product;

  const ProductScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customMainAppBar(title: product.name,),
      bottomNavigationBar: CustomNavBar(),
      body: ListView(
        children: [
          CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.7,
                viewportFraction: 0.9,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
              ),
              items: [HeroCarousel(product: product,),]
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                        color: Color(0xff303030),
                        fontSize: 26,
                        fontFamily: "Semplicita",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    BlocBuilder<WishlistBloc, WishlistState>(
  builder: (context, state) {
    return IconButton(onPressed: (){
      context.read<WishlistBloc>().add(AddWishlistProduct(product));
      final snackBar = SnackBar(content: Text('Added to wishlist!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }, icon: Icon(Icons.favorite_border));
  },
),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "₹${product.price}",
                      style: TextStyle(
                        color: Color(0xff303030),
                        fontSize: 28,
                        fontFamily: "Semplicita",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ExpansionTile(
                    title: Text(
                      'Product Information',
                      style:TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: "Semplicita",
                        fontWeight: FontWeight.w600,
                  ),
                  ),
                    children: [
                      ListTile(
                        title: Text(
                          product.description,
                          style:TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontFamily: "Semplicita",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ExpansionTile(
                    title: Text(
                      'Delivery Information',
                      style:TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: "Semplicita",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    children: [
                      ListTile(
                        title: Text(
                          'Delivery charges are based upon the courier guys asking money',
                          style:TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontFamily: "Semplicita",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                BlocBuilder<CartBloc, CartState>(
  builder: (context, state) {
    if(state is CartLoading){
      return Center(child: CircularProgressIndicator(),);
    }
    if (state is CartLoaded){
      return Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<CartBloc>().add(CartProductAdded(product));
          },
          style: ElevatedButton.styleFrom(primary: Colors.black),
          child: Text(
            'ADD TO CART',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontFamily: "Semplicita",
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      );
    }else {
      return Text('something went wrong');
    }
  },
),
              ],
            ),
          ),
        ],
      ),

    );
  }
}