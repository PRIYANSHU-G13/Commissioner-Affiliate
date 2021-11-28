import 'package:commissioner_affiliate_1/models/category_model.dart';
import 'package:commissioner_affiliate_1/models/models.dart';
import 'package:commissioner_affiliate_1/screens/screens.dart';
import 'package:commissioner_affiliate_1/screens/user/user.dart';
import 'package:flutter/material.dart';

class AppRouter{
  static Route onGenerateRoute(RouteSettings settings){
    print('This is route: ${settings.name}');
        switch(settings.name){
          case SplashScreen.routeName :
            return SplashScreen.route();
          case '/':
            return HomeScreen.route();
          case HomeScreen.routeName:
            return HomeScreen.route();
          case CatalogScreen.routeName:
            return CatalogScreen.route(category: settings.arguments as Category);
          case CartScreen.routeName:
            return CartScreen.route();
          case ProductScreen.routeName:
            return ProductScreen.route(product: settings.arguments as Product);
          case UserScreen.routeName:
            return UserScreen.route();
          case WishlistScreen.routeName:
            return WishlistScreen.route();
          case LogInScreen.routeName:
            return LogInScreen.route();
          case CheckoutScreen.routeName:
            return CheckoutScreen.route();
          default:
            return _errorRoute();
        }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: HomeScreen.routeName),
      builder: (_) => Scaffold(appBar:AppBar(title: Text('Error'))),
    );
  }
}