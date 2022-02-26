import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/Product/ProductController.dart';
import 'package:ugaoo/misc/colors.dart';

class OtherDetails extends StatelessWidget {
  final heading;
  const OtherDetails({Key? key, this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _productData = heading == "Plant Essential"
        ? Get.find<ProductController>().productEssential
        : Get.find<ProductController>().productProblems;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$heading",
          style: TextStyle(
            color: kHeadingTextColor,
            fontWeight: FontWeight.w500,
            fontSize: width * 0.075,
          ),
        ),
        SizedBox(height: 8.0),
        pointsWidget(
            title: "${_productData?.keys.elementAt(0)}: ",
            content: "${_productData?.values.elementAt(0)}"),
        SizedBox(height: 8.0),
        pointsWidget(
            title: "${_productData?.keys.elementAt(1)}: ",
            content: "${_productData?.values.elementAt(1)}"),
        SizedBox(height: 8.0),
        pointsWidget(
            title: "${_productData?.keys.elementAt(2)}: ",
            content: "${_productData?.values.elementAt(2)}"),
      ],
    );
  }
}

class pointsWidget extends StatelessWidget {
  final title, content;
  const pointsWidget({
    Key? key,
    this.title,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      children: [
        TextSpan(
            text: "$title",
            style: TextStyle(
              color: kBackgroundColor,
              fontSize: width * 0.05,
              fontWeight: FontWeight.w800,
            )),
        TextSpan(
            text: "$content",
            style: TextStyle(
              color: kBackgroundColor,
              fontSize: width * 0.05,
            ))
      ],
    ));
  }
}
