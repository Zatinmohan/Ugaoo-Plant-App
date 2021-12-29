import 'package:flutter/material.dart';
import 'package:ugaoo/Screens/Payment/UPI.dart';
import 'package:ugaoo/Screens/Payment/card.dart';
import 'package:ugaoo/Screens/Payment/netBanking.dart';
import 'package:ugaoo/misc/colors.dart';

class PaymentList extends StatelessWidget {
  final cardKey, upi;
  const PaymentList({Key? key, this.cardKey, this.upi}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int? _groupValue = 1;
    int points = 50;
    return Container(
      height: height * 0.45,
      // color: Colors.grey,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        children: ListTile.divideTiles(context: context, tiles: [
          AppPointsWidget(points: points),
          ExpansionTile(
            title: Text("Debit/Credit Card"),
            children: [
              CreditDebitCard(cardKey: cardKey),
            ],
          ),
          NetBanking(),
          UPI(upi: upi),
          ListTile(
            title: Text("COD"),
            trailing: Radio(
                value: 0,
                groupValue: _groupValue,
                onChanged: (int? val) {
                  _groupValue = val;
                }),
          ),
        ]).toList(),
      ),
    );
  }
}

class AppPointsWidget extends StatelessWidget {
  const AppPointsWidget({
    Key? key,
    required this.points,
  }) : super(key: key);

  final int points;

  @override
  Widget build(BuildContext context) {
    bool? _groupButton = false;
    return ListTile(
      leading: Icon(Icons.wallet_giftcard),
      title: Text("Ugaoo Points"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Balance"),
          SizedBox(width: 5.0),
          Text("$points",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: kBackgroundColor)),
          points == 0
              ? SizedBox.shrink()
              : Radio(
                  value: true,
                  groupValue: _groupButton,
                  onChanged: (bool? val) {
                    _groupButton = val;
                  })
        ],
      ),
    );
  }
}
