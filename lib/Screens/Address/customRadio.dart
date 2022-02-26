import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/Address/AddressFormController.dart';
import 'package:ugaoo/misc/colors.dart';

class CustomRadioWidget extends StatelessWidget {
  final value;

  const CustomRadioWidget({Key? key, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(() => Radio(
            value: "$value",
            groupValue: Get.find<AddressFormController>().addressType.value,
            onChanged: (String? val) {
              Get.find<AddressFormController>().addressType.value = value;
            })),
        Text(
          "$value",
          style: TextStyle(
            color: kHeadingTextColor,
            fontSize: width * 0.04,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
