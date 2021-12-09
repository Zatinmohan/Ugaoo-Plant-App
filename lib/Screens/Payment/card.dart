import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ugaoo/misc/colors.dart';

class CreditDebitCard extends StatelessWidget {
  final cardKey;
  const CreditDebitCard({Key? key, this.cardKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Form(
          key: cardKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value != null && (value.isEmpty || value.length < 16))
                    return "Incorrect Card number";
                  return null;
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                inputFormatters: [LengthLimitingTextInputFormatter(16)],
                decoration:
                    customInputDecoration.copyWith(label: Text("Card No.")),
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: TextFormField(
                      validator: (value) {
                        if (value != null &&
                            (value.isEmpty || value.length < 4))
                          return "Incorrect Date";
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(4)],
                      textInputAction: TextInputAction.next,
                      decoration:
                          customInputDecoration.copyWith(label: Text("MMYY")),
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Flexible(
                    flex: 1,
                    child: TextFormField(
                      validator: (value) {
                        if (value != null &&
                            (value.isEmpty || value.length < 3))
                          return "Incorrect CVV";
                        return null;
                      },
                      inputFormatters: [LengthLimitingTextInputFormatter(3)],
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: customInputDecoration.copyWith(
                        label: Text("CVV"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
