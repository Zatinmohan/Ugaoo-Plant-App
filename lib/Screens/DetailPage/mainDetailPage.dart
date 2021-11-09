import 'package:flutter/material.dart';

import 'package:ugaoo/Screens/DetailPage/upperDetail.dart';
import 'package:ugaoo/misc/colors.dart';

import 'bottomDetails.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Detail Page");
    PageController _controller = PageController();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ksecondaryBackgroundColor,
        body: Column(
          children: [
            UpperDetail(),
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
                      "Rs. 250",
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
                  onTap: () => print("Add to Cart"),
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
