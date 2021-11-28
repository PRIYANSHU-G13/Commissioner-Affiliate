import 'package:carousel_slider/carousel_slider.dart';
import 'package:commissioner_affiliate_1/blocs/category/category_bloc.dart';
import 'package:commissioner_affiliate_1/blocs/product/product_bloc.dart';
import 'package:commissioner_affiliate_1/models/category_model.dart';
import 'package:commissioner_affiliate_1/models/models.dart';
import 'package:commissioner_affiliate_1/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      bottomNavigationBar: CustomNavBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
                child: BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    if(state is CategoryLoading){
                      return Center(child: CircularProgressIndicator(),);
                    }
                    if(state is CategoryLoaded){
                      return CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 1.7,
                          viewportFraction: 0.9,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: false,
                        ),
                        items: state.categories.map((category) => HeroCarousel(category: category)).toList(),
                      );
                    }
                    else{return Text('something went wrong');}
  },
)
            ),
            SizedBox(height: 20,),
            SectionTitle(title : 'RECOMMENDED'),
        ProductCarousel(products : Product.products.where((product)=>product.isRecommended).toList()),
            SectionTitle(title : 'MOST POPULAR'),
      ProductCarousel(products : Product.products
          .where((product)=>product.isPopular)
          .toList())
          ],
        ),
      ),
    );
  }
}


