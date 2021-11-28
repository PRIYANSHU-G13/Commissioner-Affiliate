import 'package:commissioner_affiliate_1/blocs/wishlist/wishlist_bloc.dart';
import 'package:commissioner_affiliate_1/models/product_model.dart';
import 'package:commissioner_affiliate_1/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => WishlistScreen(),
    );
  }

  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customMainAppBar(title: 'WISHLIST'),
      bottomNavigationBar: CustomNavBar(),
      body:
      BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WishlistLoaded) {
            return GridView.builder(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0, vertical: 16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1.15),
              itemCount: state.wishlist.products.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(child: ProductCard(
                  products: state.wishlist.products[index], widthfactor: 1.0,));
              },
            );
          }
          else{
            return Text("something went wrong");
          }
        },
      ),
    );
  }
}
