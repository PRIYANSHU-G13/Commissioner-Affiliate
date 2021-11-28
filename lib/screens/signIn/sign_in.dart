import 'package:commissioner_affiliate_1/widget/widget.dart';
import 'package:flutter/material.dart';
class SignInScreen extends StatelessWidget {
  static const String routeName = '/signin';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => SignInScreen(),
    );
  }

  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding : const EdgeInsets.only(top: 20),
              child: Center(
                child: SafeArea(
                  child: Container(
                    width: 118,
                    height: 111,
                    child: Image.asset('assets/logo.png'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "WELCOME",
                    style: TextStyle(
                      color: Color(0xff303030),
                      fontSize: 34,
                      fontFamily: "Semplicita",
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding:const EdgeInsets.only(left: 30, right: 20) ,
              child: TextField(
                decoration : InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      color: Color(0xff909090),
                      fontSize: 14,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff909090)),
                    ),
                    hintText: 'Enter your Name'
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding:const EdgeInsets.only(left: 30, right: 20) ,
              child: TextField(
                decoration : InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Color(0xff909090),
                      fontSize: 14,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff909090)),
                    ),
                    hintText: 'Enter your Email'
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding:const EdgeInsets.only(left: 30, right: 20) ,
              child: TextField(
                obscureText: true,
                decoration : InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Color(0xff909090),
                      fontSize: 14,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff909090)),
                    ),
                    hintText: 'Enter your password'
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}