import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ugaoo/misc/colors.dart';

class BottomDetails extends StatelessWidget {
  const BottomDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingWidget(heading: "Description"),
          SizedBox(height: 8.0),
          Text(
            "Chlorophytum Spider, also the Spider Plant is an impressive indoor plant and perfect for beginners. It is not only easy to care for but also a NASA certified air purifier. Its long, green foliage with white variegations look good in both hanging planters and as desktop setups. In favourable conditions, it blooms with small white flowers and its pups grow on stems cascading from the plant.",
            style: TextStyle(
              color: kBackgroundColor,
              fontSize: width * 0.05,
            ),
          ),
          SizedBox(height: 16.0),
          HeadingWidget(heading: "Plant Essentails"),
          SizedBox(height: 8.0),
          pointsWidget(
              title: "Fertilizer/ feed for the plant:",
              content:
                  "Feed your plant a generic liquid fertiliser diluted to half strength every 2 week"),
          SizedBox(height: 5.0),
          pointsWidget(
              title: "Repotting: ",
              content:
                  "Repot your plant when it begins to outgrow the current pot. Choose a pot one size larger than the current pot. The start of spring is the best time to repot your Spider plant"),
          SizedBox(height: 5.0),
          pointsWidget(
              title: "Propagation : ",
              content:
                  "Chlorophytum Spider can be propagated by dividing the main plant or by detaching and replanting the plantlet during monsoon."),
        ],
      ),
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

class HeadingWidget extends StatelessWidget {
  final heading;
  const HeadingWidget({
    Key? key,
    this.heading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$heading",
      style: TextStyle(
        color: kHeadingTextColor,
        fontWeight: FontWeight.w500,
        fontSize: width * 0.075,
      ),
    );
  }
}
