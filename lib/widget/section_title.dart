
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Text(
          title,
          style: TextStyle(
            color: Color(0xff303030),
            fontSize: 20,
            fontFamily: "Semplicita",
            fontWeight: FontWeight.w500,
            letterSpacing: 2.40,
          ),
        ),
      ),
    );
  }
}
