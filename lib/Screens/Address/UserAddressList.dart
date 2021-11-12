import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/CartItemController.dart';
import 'package:ugaoo/Model/AddressDummy.dart';
import 'package:ugaoo/misc/colors.dart';

class AddressList extends StatelessWidget {
  const AddressList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartItemController _controller = Get.put(CartItemController());
    List<AddressDummy> dummyList = _controller.addressList;

    return Container(
      child: ListView.builder(
        itemCount: dummyList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            height: height * 0.3,
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
            ),
          );
        },
      ),
    );
  }
}
