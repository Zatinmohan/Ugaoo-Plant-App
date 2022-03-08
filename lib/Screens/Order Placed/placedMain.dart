import 'package:flutter/material.dart';
import 'package:ugaoo/misc/colors.dart';

class OrderPlaced extends StatelessWidget {
  const OrderPlaced({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      padding: EdgeInsets.all(10.0),
      height: height,
      width: width,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset("assets/misc/placed.gif"),
        SizedBox(height: 10.0),
        Text("Your order has been placed successfully",
            style: TextStyle(
              color: kHeadingTextColor,
              fontSize: width * 0.05,
              fontWeight: FontWeight.bold,
            )),
      ]),
    )));
  }
}
