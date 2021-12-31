import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/miscController.dart';

import 'package:ugaoo/Screens/DetailPage/customBar.dart';
import 'package:ugaoo/Screens/DetailPage/plantNeeds.dart';
import 'package:ugaoo/misc/colors.dart';

class UpperDetail extends StatelessWidget {
  final image, water, light, temp, name;
  const UpperDetail(
      {Key? key, this.image, this.water, this.light, this.temp, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MiscController _controller = Get.put(MiscController());
    return Container(
      height: height * 0.62,
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
                        Text("$water",
                            style: TextStyle(
                                color: kDeailHeadingColor,
                                fontSize: width * 0.055)),
                        SizedBox(height: 15.0),
                        PlantNeeds(icon: Icons.wb_sunny, name: "Light"),
                        SizedBox(height: 10.0),
                        Text("$light",
                            style: TextStyle(
                                color: kDeailHeadingColor,
                                fontSize: width * 0.055)),
                        SizedBox(height: 15.0),
                        PlantNeeds(icon: Icons.thermostat, name: "Temperature"),
                        SizedBox(height: 10.0),
                        Text("$temp C",
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
                      tag: image,
                      child: Center(
                        child: Container(
                          child: Image.network(
                            image,
                            height: height * 0.6,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 10.0, bottom: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                              flex: 2,
                              child: Container(
                                  height: width * 0.12,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: ksecondaryBackgroundColor,
                                        focusedBorder: focusedBorder.copyWith(
                                            borderSide: BorderSide(
                                          color: ksecondaryBackgroundColor,
                                          width: 0.0,
                                        )),
                                        // border: textFieldBorder.copyWith(
                                        //     borderSide: BorderSide(
                                        //   color: ksecondaryBackgroundColor,
                                        //   width: 0.0,
                                        // )),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(30.0)),
                                        hintText: "Pincode",
                                        hintStyle: TextStyle(
                                          color: kHeadingTextColor,
                                          fontSize: width * 0.04,
                                        )),
                                  ))),
                          SizedBox(width: 10.0),
                          Flexible(
                            flex: 1,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: kPrimaryTextColor,
                                ),
                                onPressed: () {
                                  _controller.page.value =
                                      !_controller.page.value;
                                },
                                child: Text(
                                  "Check",
                                )),
                          ),
                        ],
                      ),
                      Obx(() {
                        return _controller.page.value
                            ? Text("Available in 3-5 Days",
                                style: TextStyle(
                                  color: kHeadingTextColor,
                                  fontSize: width * 0.04,
                                ))
                            : SizedBox.shrink();
                      })
                    ],
                  ),
                )),
            CustomBar(product: name),
          ],
        ),
      ),
    );
  }
}
