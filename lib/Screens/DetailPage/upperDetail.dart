import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/miscController.dart';
import 'package:ugaoo/Screens/DetailPage/customBar.dart';
import 'package:ugaoo/Screens/DetailPage/plantNeeds.dart';
import 'package:ugaoo/misc/colors.dart';

class UpperDetail extends StatelessWidget {
  const UpperDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.6,
      width: double.infinity,
      child: Card(
        elevation: 2.0,
        color: kBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
        child: Stack(
          children: [
            PageIndicatorWidget(),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PlantNeeds(icon: FontAwesomeIcons.tint, name: "Water"),
                        SizedBox(height: 10.0),
                        Text("1/Week",
                            style: TextStyle(
                                color: kDeailHeadingColor,
                                fontSize: width * 0.055)),
                        SizedBox(height: 15.0),
                        PlantNeeds(icon: Icons.wb_sunny, name: "Light"),
                        SizedBox(height: 10.0),
                        Text("Medium",
                            style: TextStyle(
                                color: kDeailHeadingColor,
                                fontSize: width * 0.055)),
                        SizedBox(height: 15.0),
                        PlantNeeds(icon: Icons.thermostat, name: "Temperature"),
                        SizedBox(height: 10.0),
                        Text("28.5 C",
                            style: TextStyle(
                                color: kDeailHeadingColor,
                                fontSize: width * 0.055)),
                        SizedBox(height: 15.0),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Hero(
                      tag: Get.arguments['image'],
                      child: Center(
                        child: Container(
                          child: Image.network(
                            Get.arguments['image'],
                            height: height * 0.6,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomBar(),
          ],
        ),
      ),
    );
  }
}

class PageIndicatorWidget extends StatelessWidget {
  const PageIndicatorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MiscController _controller = Get.put(MiscController());
    print("Indicator");
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Container(
              // color: Colors.black,
              height: 10.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Obx(() {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 150),
                      decoration: BoxDecoration(
                        color: _controller.index.value == index
                            ? ksecondaryBackgroundColor
                            : kDeailHeadingColor,
                        shape: BoxShape.circle,
                      ),
                      child: SizedBox(
                        width: 20.0,
                      ),
                    );
                  });
                },
              ))),
    );
  }
}
