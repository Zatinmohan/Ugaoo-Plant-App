import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/Product/ProductController.dart';

import 'package:ugaoo/Screens/DetailPage/customBar.dart';
import 'package:ugaoo/Screens/DetailPage/plantNeeds.dart';
import 'package:ugaoo/misc/colors.dart';

class UpperDetail extends StatelessWidget {
  const UpperDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<ProductController>();
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
                        Text("${_controller.productRequirement![0]}",
                            style: TextStyle(
                                color: kDeailHeadingColor,
                                fontSize: width * 0.055)),
                        SizedBox(height: 15.0),
                        PlantNeeds(icon: Icons.wb_sunny, name: "Light"),
                        SizedBox(height: 10.0),
                        Text("${_controller.productRequirement![1]}",
                            style: TextStyle(
                                color: kDeailHeadingColor,
                                fontSize: width * 0.055)),
                        SizedBox(height: 15.0),
                        PlantNeeds(icon: Icons.thermostat, name: "Temperature"),
                        SizedBox(height: 10.0),
                        Text("${_controller.productRequirement![2]} C",
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
                      tag: _controller.productImage.toString(),
                      child: Center(
                        child: Container(
                          child: Image.network(
                            _controller.productImage.toString(),
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
                                  _controller.changePincodeField();
                                },
                                child: Text(
                                  "Check",
                                )),
                          ),
                        ],
                      ),
                      Obx(() {
                        return _controller.checkPincodeField()
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
            CustomBar(),
          ],
        ),
      ),
    );
  }
}
