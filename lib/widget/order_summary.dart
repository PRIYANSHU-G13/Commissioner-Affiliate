import 'package:commissioner_affiliate_1/blocs/cart/cart_bloc.dart';
import 'package:commissioner_affiliate_1/models/cart_model.dart';
import 'package:commissioner_affiliate_1/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
  builder: (context, state) {
    if(state is CartLoaded){
      return Column(
        children: [
          Divider(
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('SUBTOTAL',style: TextStyle(
                      color: Color(0xff303030),
                      fontSize: 15,
                      fontFamily: "Semplicita",
                      fontWeight: FontWeight.w700,
                    ),),
                    Text('Rs.${state.cart.subtotalstring}',style: TextStyle(
                      color: Color(0xff303030),
                      fontSize: 15,
                      fontFamily: "Semplicita",
                      fontWeight: FontWeight.w600,
                    ),),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('DELIVERY FEE',style: TextStyle(
                      color: Color(0xff303030),
                      fontSize: 15,
                      fontFamily: "Semplicita",
                      fontWeight: FontWeight.w700,
                    ),),
                    Text('Rs.${state.cart.deliveryfeestring}',style: TextStyle(
                      color: Color(0xff303030),
                      fontSize: 15,
                      fontFamily: "Semplicita",
                      fontWeight: FontWeight.w600,
                    ),),
                  ],
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(color: Colors.black),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total',style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: "Semplicita",
                        fontWeight: FontWeight.w600,
                      ),),
                      Text('Rs.${state.cart.totalstring}',style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: "Semplicita",
                        fontWeight: FontWeight.w600,
                      ),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }
    else{
      return Text('something went wrong');
    }

  },
);
  }
}
