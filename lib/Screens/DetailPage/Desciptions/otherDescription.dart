import 'package:flutter/material.dart';
import 'package:ugaoo/misc/colors.dart';

class OtherDetails extends StatelessWidget {
  final heading;
  const OtherDetails({Key? key, this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            title: "Fertilizer/ feed for the plant: ",
            content:
                "Feed your plant a generic liquid fertiliser diluted to half strength every 2 week"),
        SizedBox(height: 8.0),
        pointsWidget(
            title: "Repotting: ",
            content:
                "Repot your plant when it begins to outgrow the current pot. Choose a pot one size larger than the current pot. The start of spring is the best time to repot your Spider plant"),
        SizedBox(height: 8.0),
        pointsWidget(
            title: "Propagation : ",
            content:
                "Chlorophytum Spider can be propagated by dividing the main plant or by detaching and replanting the plantlet during monsoon."),
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
