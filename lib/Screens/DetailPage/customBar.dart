import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/misc/colors.dart';

class CustomBar extends StatelessWidget {
  final product = "Product";
  const CustomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Icons.arrow_back_ios, size: width * 0.065),
              ),
              SizedBox(width: 10.0),
              Text("$product",
                  style: TextStyle(
                    color: kDeailHeadingColor,
                    fontWeight: FontWeight.w600,
                    fontSize: width * 0.08,
                  )),
            ],
          ),
          IconButton(
              onPressed: () => print("Liked"),
              icon: Icon(
                Icons.favorite_border,
                size: width * 0.065,
              )),
        ],
      ),
    );
  }
}
