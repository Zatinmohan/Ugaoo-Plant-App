import 'package:flutter/material.dart';
import 'package:ugaoo/misc/colors.dart';

class UPI extends StatelessWidget {
  final upi;
  const UPI({Key? key, this.upi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text("UPI"),
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Form(
            key: upi,
            child: TextFormField(
              validator: (value) {
                if (value != null &&
                    (value.isEmpty == true || value.contains("@") == false))
                  return "Incorrect UPI";
                return null;
              },
              textInputAction: TextInputAction.done,
              decoration: customInputDecoration.copyWith(label: Text("UPI ID")),
            ),
          ),
        ),
      ],
    );
  }
}
