import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/CartItemController.dart';
import 'package:ugaoo/Model/dummy.dart';

import 'package:ugaoo/Screens/DetailPage/upperDetail.dart';
import 'package:ugaoo/misc/colors.dart';

import 'bottomDetails.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Dummy _info = Get.arguments;
    PageController _controller = PageController();
    final CartItemController _items = Get.put(CartItemController());

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ksecondaryBackgroundColor,
        body: Column(
          children: [
            UpperDetail(
                name: _info.name,
                image: _info.image,
                temp: _info.temp,
                water: _info.water,
                light: _info.light),
            SizedBox(height: 10.0),
            Expanded(child: BottomDetails(pageController: _controller)),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  width: width,
                  height: height * 0.08,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Center(
                    child: Text(
                      "Rs. ${_info.price}",
                      style: TextStyle(
                        fontSize: width * 0.07,
                        fontWeight: FontWeight.w700,
                        color: kBackgroundColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    _items.addToCart(_info);
                  },
                  child: Container(
                    width: width,
                    height: height * 0.08,
                    color: kBackgroundColor,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Center(
                      child: Text(
                        "Add To Cart",
                        style: TextStyle(
                          fontSize: width * 0.058,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
