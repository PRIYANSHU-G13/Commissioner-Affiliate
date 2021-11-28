import 'package:commissioner_affiliate_1/models/category_model.dart';
import 'package:commissioner_affiliate_1/models/models.dart';
import 'package:commissioner_affiliate_1/widget/widget.dart';
import 'package:flutter/material.dart';
class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(category : category),
    );
  }

  final Category category;
  const CatalogScreen({required this.category});


  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products.where((product) => product.category == category.name).toList();
    return Scaffold(
      appBar: customMainAppBar(title: category.name),
      bottomNavigationBar: CustomNavBar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.15),
        itemCount: categoryProducts.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(child: ProductCard(products: categoryProducts[index], widthfactor: 1.0,));
          },
      ),

      //ProductCard(products: Product.products[0],),
    );
  }

}