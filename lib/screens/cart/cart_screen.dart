import 'package:commissioner_affiliate_1/blocs/cart/cart_bloc.dart';
import 'package:commissioner_affiliate_1/models/cart_model.dart';
import 'package:commissioner_affiliate_1/models/product_model.dart';
import 'package:commissioner_affiliate_1/widget/order_summary.dart';
import 'package:commissioner_affiliate_1/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CartScreen(),
    );
  }

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customMainAppBar(title: 'CART'),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout');
                },
                child: Text('GO TO CHECKOUT', style: TextStyle(
                  color: Color(0xff303030),
                  fontSize: 26,
                  fontFamily: "Semplicita",
                  fontWeight: FontWeight.w600,
                ),),
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if(state is CartLoaded){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${state.cart.freedeliverytring}',style: TextStyle(
                            color: Color(0xff303030),
                            fontSize: 14,
                            fontFamily: "Semplicita",
                            fontWeight: FontWeight.w800,
                          ),),
                          ElevatedButton(onPressed: (){
                            Navigator.pushNamed(context, '/');
                          }, child: Text('Add More Items',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: "Semplicita",
                              fontWeight: FontWeight.w600,
                            ),),
                            style: ElevatedButton.styleFrom(primary: Colors.black, shape: RoundedRectangleBorder(),elevation: 0),
                          ),
                        ],
                      ),
                      SizedBox(width: 10,),
                      SizedBox(
                        height: 400,
                        child: ListView.builder(
                          itemCount: state.cart.productQuantity(state.cart.products).keys.length,
                          itemBuilder: (context,index) {
                            return CartProductCard(
                              product: state.cart.productQuantity(state.cart.products).keys.elementAt(index) ,
                              quantity: state.cart.productQuantity(state.cart.products).values.elementAt(index),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  OrderSummary(),
                ],
              ),
            );
          }
          else{
            return Text('Something Went Wrong');
          }
        },
      ),
    );
  }
}
