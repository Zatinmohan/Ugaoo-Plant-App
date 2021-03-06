import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/Payment/PaymentController.dart';
import 'package:ugaoo/misc/colors.dart';

class DeliveryTo extends StatelessWidget {
  const DeliveryTo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      // color: Colors.blue,
      width: width,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Delivery To",
                style: TextStyle(
                  color: kHeadingTextColor,
                  fontSize: width * 0.06,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 15.0),
              Row(
                children: [
                  Text(
                    "${Get.find<PaymentController>().deliveryTo}",
                    style: TextStyle(
                      color: kHeadingTextColor,
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.05,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5.0)),
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "${Get.find<PaymentController>().addressType}",
                      style: TextStyle(
                        color: kHeadingTextColor,
                        fontWeight: FontWeight.w700,
                        fontSize: width * 0.045,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.0),
              Text(
                "${Get.find<PaymentController>().houseNumber}, ${Get.find<PaymentController>().street}, ${Get.find<PaymentController>().landmark}",
                style: TextStyle(
                  color: kDeailHeadingColor,
                  fontWeight: FontWeight.w600,
                  fontSize: width * 0.04,
                ),
              ),
              SizedBox(height: 10.0),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Pincode: ",
                    style: TextStyle(
                      color: kHeadingTextColor,
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.045,
                    )),
                TextSpan(
                    text: "${Get.find<PaymentController>().pincode}",
                    style: TextStyle(
                      color: kDeailHeadingColor,
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.045,
                    )),
              ])),
              SizedBox(height: 10.0),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Mobile: ",
                    style: TextStyle(
                      color: kHeadingTextColor,
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.045,
                    )),
                TextSpan(
                    text: "+91 ${Get.find<PaymentController>().phone}",
                    style: TextStyle(
                      color: kDeailHeadingColor,
                      fontWeight: FontWeight.w500,
                      fontSize: width * 0.045,
                    )),
              ])),
            ],
          ),
        ),
      ),
    );
  }
}
