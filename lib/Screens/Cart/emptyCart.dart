import 'package:flutter/material.dart';
import 'package:ugaoo/misc/colors.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/misc/emptyCart.png'),
          SizedBox(height: 5.0),
          Text(
            "Your shopping cart is Empty",
            style: TextStyle(
              color: kHeadingTextColor,
              fontSize: width * 0.060,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            "Please add something, Carts have feelings too.",
            style: TextStyle(
              color: kDeailHeadingColor,
              fontSize: width * 0.03,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
