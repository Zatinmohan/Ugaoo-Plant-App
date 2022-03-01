import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/Payment/PaymentController.dart';
import 'package:ugaoo/Screens/Payment/UPI.dart';
import 'package:ugaoo/Screens/Payment/card.dart';
import 'package:ugaoo/Screens/Payment/netBanking.dart';
import 'package:ugaoo/misc/colors.dart';

class PaymentList extends StatelessWidget {
  const PaymentList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.45,
      // color: Colors.grey,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        children: ListTile.divideTiles(context: context, tiles: [
          AppPointsWidget(),
          ExpansionTile(
            title: Text("Debit/Credit Card"),
            children: [
              CreditDebitCard(),
            ],
          ),
          NetBanking(),
          UPI(),
          Obx(
            () => CheckboxListTile(
              value: Get.find<PaymentController>().cod.value,
              title: Text("COD"),
              onChanged: (bool? value) {
                Get.find<PaymentController>().cod.value = value!;
              },
            ),
          )
        ]).toList(),
      ),
    );
  }
}

class AppPointsWidget extends StatelessWidget {
  const AppPointsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => CheckboxListTile(
          value: Get.find<PaymentController>().appPointCheckbox.value,
          secondary: Icon(Icons.wallet_giftcard),
          title: Text("Ugaoo Points"),
          subtitle: RichText(
              text: TextSpan(
            children: [
              TextSpan(text: "Balance: ", style: TextStyle(color: Colors.grey)),
              TextSpan(
                  text: "${Get.find<PaymentController>().appPoints}",
                  style: TextStyle(
                      color: kBackgroundColor, fontWeight: FontWeight.bold))
            ],
          )),
          onChanged: (bool? val) =>
              Get.find<PaymentController>().checkAppPoints(val),
          // onChanged: _price.appPoints.value == 0
          //     ? null
          //     : (bool? val) {
          //         _controller.points.value = val!;

          //         // if (_controller.points.value == true &&
          //         //     _price.appPoints.value < _price.getPrice() &&
          //         //     _controller.cod.value == false) {
          //         //   final _snackBar = SnackBar(
          //         //       content: Text(
          //         //           'Balance is Low! Please select a payment method'));

          //         //   ScaffoldMessenger.of(context).showSnackBar(_snackBar);
          //         // }
          //       },
        ));
  }
}
