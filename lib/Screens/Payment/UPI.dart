import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/Payment/PaymentController.dart';
import 'package:ugaoo/misc/colors.dart';

class UPI extends StatelessWidget {
  const UPI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text("UPI"),
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Form(
            key: Get.find<PaymentController>().upi,
            child: TextFormField(
              validator: (value) =>
                  Get.find<PaymentController>().upiValidator(value),
              textInputAction: TextInputAction.done,
              decoration: customInputDecoration.copyWith(label: Text("UPI ID")),
            ),
          ),
        ),
      ],
    );
  }
}
