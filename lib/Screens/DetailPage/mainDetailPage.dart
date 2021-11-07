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
                child: GestureDetector(
                  onTap: () => print("Add to Cart"),
                  child: Container(
                    width: width,
                    height: height * 0.08,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Center(
                      child: Text(
                        "ADD TO CART",
                        style: TextStyle(
                          fontSize: width * 0.058,
                          fontWeight: FontWeight.w500,
                          color: kDeailHeadingColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () => print("Buy Now"),
                  child: Container(
                    width: width,
                    height: height * 0.08,
                    color: kBackgroundColor,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Center(
                      child: Text(
                        "BUY NOW",
                        style: TextStyle(
                          fontSize: width * 0.06,
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
