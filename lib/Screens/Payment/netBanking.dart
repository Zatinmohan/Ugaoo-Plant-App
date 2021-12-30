import 'package:flutter/material.dart';
import 'package:ugaoo/misc/bankList.dart';

class NetBanking extends StatefulWidget {
  final netbanking;
  const NetBanking({Key? key, this.netbanking}) : super(key: key);

  @override
  State<NetBanking> createState() => _NetBankingState();
}

class _NetBankingState extends State<NetBanking> {
  String? val;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text("Net Banking"),
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Container(
            height: 50.0,
            child: Form(
              key: widget.netbanking,
              child: DropdownButtonFormField(
                validator: (String? value) {
                  if (value == null ||
                      value == "Select a Bank" ||
                      value.isEmpty == true) return "Select a bank";
                  return null;
                },
                isExpanded: false,
                value: val,
                hint: Text("Select a Bank"),
                items: bankName.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    val = value;
                  });
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
