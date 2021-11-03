import 'package:flutter/material.dart';
import 'package:ugaoo/misc/colors.dart';

class ProductDescription extends StatelessWidget {
  final title, content;
  const ProductDescription({Key? key, this.title, this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title",
          style: TextStyle(
            color: kHeadingTextColor,
            fontWeight: FontWeight.w500,
            fontSize: width * 0.075,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          "$content",
          style: TextStyle(
            color: kBackgroundColor,
            fontSize: width * 0.05,
          ),
        ),
      ],
    );
  }
}
