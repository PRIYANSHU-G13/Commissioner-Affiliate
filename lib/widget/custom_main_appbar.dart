import 'package:flutter/material.dart';
class customMainAppBar extends StatelessWidget with PreferredSizeWidget{
  final String title;
  const customMainAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Container(
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            color: Color(0xff303030),
            fontSize: 24,
            fontFamily: "Semplicita",
            fontWeight: FontWeight.w500,
            letterSpacing: 2.40,
          ),
        ),
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