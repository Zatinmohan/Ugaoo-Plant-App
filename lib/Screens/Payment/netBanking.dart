import 'package:flutter/material.dart';
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
            child: DropdownButtonFormField(
              isExpanded: false,
              hint: Text("Select a Bank"),
              items: bankName.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                print(value);
              },
            ),
          ),
        )
      ],
    );
  }
}
