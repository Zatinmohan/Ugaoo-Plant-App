import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/CartItemController.dart';
import 'package:ugaoo/Screens/Cart/CartPrice.dart';
import 'package:ugaoo/Screens/Cart/Items.dart';
import 'package:ugaoo/misc/PageIndication.dart';
import 'package:ugaoo/misc/colors.dart';

class MainCart extends StatelessWidget {
  const MainCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartItemController _controller = Get.put(CartItemController());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ksecondaryBackgroundColor,
          centerTitle: true,
          elevation: 0.0,
          title: Column(
            children: [
              Text(
                "Cart",
                style: TextStyle(
                  color: kHeadingTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: width * 0.055,
                ),
              ),
              SizedBox(height: 1.0),
              Obx(() {
                return Text(
                  "${_controller.getLength()} Item",
                  style: TextStyle(
                    color: kHeadingTextColor,
                    fontWeight: FontWeight.w400,
                    fontSize: width * 0.045,
                  ),
                );
              })
            ],
          ),
          leading: IconButton(
              onPressed: () => print("Back"),
              icon: Icon(
                Icons.arrow_back_ios,
                color: kHeadingTextColor,
              ))),
      body: SingleChildScrollView(
        child: Container(
          height: height,
          child: Column(
            children: [
              SizedBox(height: 10.0),
              PageIndicator(pageNo: 1),
              SizedBox(height: 10.0),
              Flexible(flex: 2, child: ItemCart()),
              Flexible(
                flex: 1,
                child: CartPrice(),
              ),
            ],
          ),
        ),
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
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Center(
                  child: Text(
                    "Rs. 1500",
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
                onTap: () => print("Select Address"),
                child: Container(
                  width: width,
                  height: height * 0.08,
                  color: kBackgroundColor,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Center(
                    child: Text(
                      "Select Address",
                      style: TextStyle(
                        fontSize: width * 0.055,
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
    );
  }
}
