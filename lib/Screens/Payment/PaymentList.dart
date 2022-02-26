import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/Cart/CartController.dart';
import 'package:ugaoo/Controller/miscController.dart';
import 'package:ugaoo/Screens/Payment/UPI.dart';
import 'package:ugaoo/Screens/Payment/card.dart';
import 'package:ugaoo/Screens/Payment/netBanking.dart';
import 'package:ugaoo/misc/colors.dart';

class PaymentList extends StatelessWidget {
  final cardKey, upi, netbanking;

  const PaymentList({Key? key, this.cardKey, this.upi, this.netbanking})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MiscController _controller = Get.put(MiscController());
    return Container(
      height: height * 0.45,
      // color: Colors.grey,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        children: ListTile.divideTiles(context: context, tiles: [
          AppPointsWidget(cardkey: cardKey, upi: upi, netbanking: netbanking),
          ExpansionTile(
            title: Text("Debit/Credit Card"),
            children: [
              CreditDebitCard(cardKey: cardKey),
            ],
          ),
          NetBanking(netbanking: netbanking),
          UPI(upi: upi),
          Obx(
            () => CheckboxListTile(
              value: _controller.cod.value,
              title: Text("COD"),
              onChanged: (bool? value) {
                _controller.cod.value = value!;
              },
            ),
          )
        ]).toList(),
      ),
    );
  }
}

class AppPointsWidget extends StatelessWidget {
  final cardkey, netbanking, upi;
  const AppPointsWidget({
    Key? key,
    this.cardkey,
    this.netbanking,
    this.upi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MiscController _controller = Get.put(MiscController());
    final CartController _price = Get.put(CartController());
    int points = 50;
    _price.appPoints.value = points;
    return Obx(() => CheckboxListTile(
          value: _controller.points.value,
          secondary: Icon(Icons.wallet_giftcard),
          title: Text("Ugaoo Points"),
          subtitle: RichText(
              text: TextSpan(
            children: [
              TextSpan(text: "Balance: ", style: TextStyle(color: Colors.grey)),
              TextSpan(
                  text: "${_price.appPoints}",
                  style: TextStyle(
                      color: kBackgroundColor, fontWeight: FontWeight.bold))
            ],
          )),
          onChanged: _price.appPoints.value == 0
              ? null
              : (bool? val) {
                  _controller.points.value = val!;

                  // if (_controller.points.value == true &&
                  //     _price.appPoints.value < _price.getPrice() &&
                  //     _controller.cod.value == false) {
                  //   final _snackBar = SnackBar(
                  //       content: Text(
                  //           'Balance is Low! Please select a payment method'));

                  //   ScaffoldMessenger.of(context).showSnackBar(_snackBar);
                  // }
                },
        ));
  }
}
