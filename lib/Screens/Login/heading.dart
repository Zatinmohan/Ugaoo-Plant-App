import 'package:flutter/material.dart';
import 'package:ugaoo/misc/colors.dart';

class PageHeading extends StatelessWidget {
  final String? heading;
  const PageHeading({Key? key, this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.12),
      child: Text(
        "$heading",
        style: TextStyle(
          color: kHeadingTextColor,
          fontWeight: FontWeight.w700,
          fontSize: width * 0.1,
        ),
      ),
    );
  }
}
