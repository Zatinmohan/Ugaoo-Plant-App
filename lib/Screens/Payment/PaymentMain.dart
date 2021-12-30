import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/CartItemController.dart';
import 'package:ugaoo/Controller/miscController.dart';
import 'package:ugaoo/misc/PageIndication.dart';
import 'package:ugaoo/misc/colors.dart';

import 'DeliveryTo.dart';
import 'PaymentList.dart';

class PaymentMainPage extends StatelessWidget {
  const PaymentMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cardKey = GlobalKey<FormState>();
    final _upi = GlobalKey<FormState>();
    final _netbanking = GlobalKey<FormState>();

    final MiscController _controller = Get.put(MiscController());
    final CartItemController _price = Get.put(CartItemController());

    return Scaffold(
      appBar: AppBar(
          backgroundColor: ksecondaryBackgroundColor,
          centerTitle: true,
          elevation: 0.0,
          title: Text(
            "Payment",
            style: TextStyle(
              color: kHeadingTextColor,
              fontWeight: FontWeight.w600,
              fontSize: width * 0.055,
            ),
          ),
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back_ios,
                color: kHeadingTextColor,
              ))),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            height: height,
            child: Column(
              children: [
                PageIndicator(pageNo: 3),
                SizedBox(height: 20.0),
                PaymentList(
                    cardKey: _cardKey, upi: _upi, netbanking: _netbanking),
                SizedBox(height: 5.0),
                DeliveryTo(),
              ],
            )),
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
                  child: Obx(() => Text(
                        "Rs. ${_price.getPrice()}",
                        style: TextStyle(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w700,
                          color: kBackgroundColor,
                        ),
                        textAlign: TextAlign.center,
                      )),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  if (_cardKey.currentState?.validate() == true ||
                      _upi.currentState?.validate() == true ||
                      _netbanking.currentState?.validate() == true ||
                      _controller.cod.value == true ||
                      (_controller.points.value == true &&
                          _price.appPoints.value > _price.getPrice()))
                    print("Pay now");
                  else if (_controller.points.value == true &&
                      _price.appPoints.value < _price.getPrice()) {
                    final _snackBar = SnackBar(
                        content: Text(
                            'Balance is Low! Please select a payment method'));

                    ScaffoldMessenger.of(context).showSnackBar(_snackBar);
                  } else {
                    print("No");
                  }
                },
                child: Container(
                  width: width,
                  height: height * 0.08,
                  color: kBackgroundColor,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Center(
                    child: Text(
                      "Pay Now",
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
