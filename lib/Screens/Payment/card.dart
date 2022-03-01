import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/Payment/PaymentController.dart';
import 'package:ugaoo/misc/colors.dart';

class CreditDebitCard extends StatelessWidget {
  const CreditDebitCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Form(
          key: Get.find<PaymentController>().cardPayment,
          child: Column(
            children: [
              TextFormField(
                validator: (value) =>
                    Get.find<PaymentController>().cardPaymentValidator(value),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                inputFormatters: [LengthLimitingTextInputFormatter(16)],
                decoration:
                    customInputDecoration.copyWith(label: Text("Card No.")),
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: TextFormField(
                      validator: (value) =>
                          Get.find<PaymentController>().dateValidator(value),
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(4)],
                      textInputAction: TextInputAction.next,
                      decoration:
                          customInputDecoration.copyWith(label: Text("MMYY")),
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Flexible(
                    flex: 1,
                    child: TextFormField(
                      validator: (value) =>
                          Get.find<PaymentController>().cvvValidator(value),
                      inputFormatters: [LengthLimitingTextInputFormatter(3)],
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: customInputDecoration.copyWith(
                        label: Text("CVV"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
