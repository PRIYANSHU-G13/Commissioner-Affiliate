import 'package:commissioner_affiliate_1/widget/widget.dart';
import 'package:flutter/material.dart';
class UserScreen extends StatelessWidget {
  static const String routeName = '/user';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => UserScreen(),
    );
  }

  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customMainAppBar(title: 'USER'),
      bottomNavigationBar: CustomNavBar(),
    );
  }

}