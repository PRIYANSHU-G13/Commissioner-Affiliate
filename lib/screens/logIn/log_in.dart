import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LogInScreen extends StatelessWidget {
  static const String routeName = '/login';
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => LogInScreen(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/login.jpeg'),
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height:300,),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                "Commissioner",
                style: TextStyle(
                  color: Color(0xff303030),
                  fontSize: 34,
                  fontFamily: "Semplicita",
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                "AFFILATE",
                style: TextStyle(
                  color: Color(0xff303030),
                  fontSize: 34,
                  fontFamily: "Semplicita",
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.20,
                ),
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Text(
                "A better way to make money",
                style: TextStyle(
                  color: Color(0xff303030),
                  fontSize: 18,
                  fontFamily: "Semplicita",
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Text(
                "A better way to sell your business",
                style: TextStyle(
                  color: Color(0xff303030),
                  fontSize: 18,
                  fontFamily: "Semplicita",
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            SizedBox(height: 180,),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child:Text('Get Started',style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: "Semplicita",
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.0,) ,
            ),
            ),
            ),
          ],
        ),
      ),
    );
  }

}
