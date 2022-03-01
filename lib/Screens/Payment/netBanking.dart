import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/Payment/PaymentController.dart';
import 'package:ugaoo/misc/bankList.dart';

class NetBanking extends StatelessWidget {
  const NetBanking({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text("Net Banking"),
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Container(
              height: 50.0,
              child: Obx(
                () => Form(
                  key: Get.find<PaymentController>().netbanking,
                  child: DropdownButtonFormField(
                    validator: (String? val) =>
                        Get.find<PaymentController>().netbankingValidator(val),
                    isExpanded: false,
                    value: Get.find<PaymentController>().bankName?.value,
                    hint: Text("Select a Bank"),
                    items:
                        bankNames.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) =>
                        Get.find<PaymentController>().bankName?.value = value!,
                  ),
                ),
              )),
        )
      ],
    );
  }
}
