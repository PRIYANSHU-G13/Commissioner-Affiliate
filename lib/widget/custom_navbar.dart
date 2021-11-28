import 'package:flutter/material.dart';
class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Container(
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(icon: Icon(Icons.home_outlined, size: 30,),onPressed: (){
              Navigator.pushNamed(context, '/');
            }),
            IconButton(icon: Icon(Icons.shopping_cart_outlined, size: 30,),onPressed: (){
              Navigator.pushNamed(context, '/cart');
            }),
            IconButton(icon: Icon(Icons.person_outline, size: 30,),onPressed: (){
              Navigator.pushNamed(context, '/user');
            }),
          ],
        ),
      ),
    );
  }
}
