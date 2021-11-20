import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/pincodeAPI.dart';
import 'package:ugaoo/misc/colors.dart';

class CustomRadioWidget extends StatelessWidget {
  final value;

  const CustomRadioWidget({Key? key, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(PincodeAPI());
    return Row(
      children: [
        Obx(() => Radio(
            value: "$value",
            groupValue: _controller.addressType.value,
            onChanged: (String? val) {
              _controller.addressType.value = value;
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
