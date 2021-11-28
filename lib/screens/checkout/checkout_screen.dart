import 'package:commissioner_affiliate_1/blocs/checkout/checkout_bloc.dart';
import 'package:commissioner_affiliate_1/widget/order_summary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:commissioner_affiliate_1/widget/widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CheckoutScreen(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customMainAppBar(title: 'CHECKOUT'),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CheckoutLoaded) {
            return Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<CheckoutBloc>()
                          .add(ConfirmCheckout(checkout: state.checkout));
                      Navigator.pushNamed(context, '/');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(),
                    ),
                    child: Text(
                      'ORDER NOW',
                      style: TextStyle(
                        color: Color(0xff303030),
                        fontSize: 18,
                        fontFamily: "Semplicita",
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Text('Something went wrong');
          }
        },
      ),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CheckoutLoaded) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CUSTOMER INFORMATION',
                        style: TextStyle(
                          color: Color(0xff303030),
                          fontSize: 18,
                          fontFamily: "Semplicita",
                          fontWeight: FontWeight.w800,
                        ),
                    ),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(email: value));
                    }, context, 'Email'),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(fullName: value));
                    }, context, 'Full Name'),
                    SizedBox(height: 20),
                    Text(
                      'DELIVERY INFORMATION',
                      style: TextStyle(
                        color: Color(0xff303030),
                        fontSize: 18,
                        fontFamily: "Semplicita",
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(address: value));
                    }, context, 'Address'),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(city: value));
                    }, context, 'City'),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(country: value));
                    }, context, 'Country'),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(zipCode: value));
                    }, context, 'ZIP Code'),
                    SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(color: Colors.black),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Center(
                            child: Text(
                              'SELECT A PAYMENT METHOD',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: "Semplicita",
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'ORDER SUMMARY',
                      style: TextStyle(
                        color: Color(0xff303030),
                        fontSize: 18,
                        fontFamily: "Semplicita",
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    OrderSummary()
                  ],
                ),
              );
            } else {
              return Text('Something went wrong');
            }
          },
        ),
      ),
    );
  }
  Padding _buildTextFormField(
      Function(String)? onChanged,
      BuildContext context,
      String labelText,
      ) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              labelText,
              style: TextStyle(
                color: Color(0xff303030),
                fontSize: 14,
                fontFamily: "Semplicita",
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.only(left: 10),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}