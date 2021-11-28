
import 'package:commissioner_affiliate_1/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product products;
  final double widthfactor;
  final bool isWishlist;

  const ProductCard({
    required this.products,
    this.widthfactor = 2.5,
    this.isWishlist =false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthfactor;
    return InkWell(
    onTap: () {
      Navigator.pushNamed(context, '/product', arguments: products);
    },
     child: Container(margin:EdgeInsets.only(left: 2,top: 0,bottom: 5,),
       width: MediaQuery.of(context).size.width / widthfactor,
       decoration: BoxDecoration(
           border: Border.all(color: Colors.black),
       ),
       child: Column(
         children: <Widget>[
           Image.network
             (
             products.imageUrl,
             fit: BoxFit.fitHeight,
             height: 90,
           ),
           Container(
             decoration: BoxDecoration(
               color: Colors.white,
               boxShadow: [BoxShadow(offset: Offset(0,10),blurRadius: 80, color: Colors.white)],
            ),
             child:
                 Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children: <Widget>[
                         RichText(text: TextSpan(
                           children: [
                             TextSpan(text: products.name +"\n",
                               style: TextStyle(
                                 color: Color(0xff5f5f5f),
                                 fontFamily: "Semplicita",
                                 fontSize: 14,
                                 fontWeight: FontWeight.w500,
                               ),
                         ),
                               TextSpan(text: 'Rs.${products.price}',
                                 style: TextStyle(
                                   color: Colors.black,
                                   fontFamily: "Semplicita",
                                   fontSize: 16,
                                   fontWeight: FontWeight.w700,
                                 ),
                               ),
                           ],
                         ),
                         ),
                       ],
                     ),
           ),
       ],
     ),
    )
    );
  }
}
