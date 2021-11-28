import 'package:commissioner_affiliate_1/blocs/cart/cart_bloc.dart';
import 'package:commissioner_affiliate_1/blocs/category/category_bloc.dart';
import 'package:commissioner_affiliate_1/blocs/product/product_bloc.dart';
import 'package:commissioner_affiliate_1/blocs/wishlist/wishlist_bloc.dart';
import 'package:commissioner_affiliate_1/config/app_router.dart';
import 'package:commissioner_affiliate_1/repositories/category/category_repository.dart';
import 'package:commissioner_affiliate_1/repositories/checkout/checkout_repository.dart';
import 'package:commissioner_affiliate_1/repositories/product/product_repository.dart';
import 'package:commissioner_affiliate_1/screens/screens.dart';
import 'package:commissioner_affiliate_1/widget/widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/checkout/checkout_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(create: (_) => CategoryBloc(categoryRepository: CategoryRepository(),)..add(LoadCategories())),
        BlocProvider(
          create: (_) => ProductBloc(
            productRepository: ProductRepository(),
          )..add(LoadProducts()),
        ),
        BlocProvider(
          create: (context) => CheckoutBloc(
            cartBloc: context.read<CartBloc>(),
            checkoutRepository: CheckoutRepository(),
          ),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: SplashScreen.routeName
      ),
    );
  }
}

