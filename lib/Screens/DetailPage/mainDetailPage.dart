import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/Product/ProductController.dart';
import 'package:ugaoo/Controller/User/UserController.dart';
import 'package:ugaoo/Model/userModel.dart';
import 'package:ugaoo/Screens/DetailPage/upperDetail.dart';
import 'package:ugaoo/misc/colors.dart';
import 'bottomDetails.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController _data = Get.find<ProductController>();

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ksecondaryBackgroundColor,
        body: Column(
          children: [
            UpperDetail(),
            SizedBox(height: 10.0),
            Expanded(child: BottomDetails()),
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
                      "Rs. ${_data.productPrice}",
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
                    CartModel items = CartModel(
                      orderID: _data.productID,
                      qty: 1,
                    );

                    Get.find<UserController>().addData(items);
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
