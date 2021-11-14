import 'package:flutter/material.dart';
import 'package:ugaoo/misc/colors.dart';

class UseLocation extends StatelessWidget {
  const UseLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(
          Icons.location_searching_sharp,
          size: width * 0.05,
        ),
        SizedBox(width: 10.0),
        Text('Use Location',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: width * 0.05,
              color: kBackgroundColor,
            ))
      ],
    );
  }
}
