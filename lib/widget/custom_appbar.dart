import 'package:flutter/material.dart';
class customAppBar extends StatelessWidget with PreferredSizeWidget{
  const customAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Column(
        children: [
          Text('Commissioner',
            style: TextStyle(
              color: Color(0xffb3a9a9),
              fontSize: 20,
              fontFamily: "Semplicita",
              fontWeight: FontWeight.w300,
              letterSpacing: 4.80,
            ),
          ),
          Text(
            "AFFILATE",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 34,
              fontFamily: "Semplicita",
              fontWeight: FontWeight.w500,
              letterSpacing: 3,
            ),
          ),
        ],
      ),
      iconTheme: IconThemeData(color: Colors.black),
      actions: [IconButton(icon: Icon(Icons.favorite_rounded, size: 30,),onPressed: (){
        Navigator.pushNamed(context, '/wishlist');
      },)],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}
