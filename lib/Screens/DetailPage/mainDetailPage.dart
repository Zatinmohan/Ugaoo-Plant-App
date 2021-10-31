import 'package:flutter/material.dart';
import 'package:ugaoo/Screens/DetailPage/upperDetail.dart';
import 'package:ugaoo/misc/colors.dart';

import 'bottomDetails.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ksecondaryBackgroundColor,
        body: Column(
          children: [
            UpperDetail(),
            SizedBox(height: 10.0),
            Expanded(child: SingleChildScrollView(child: BottomDetails())),
          ],
        ),
      ),
    );
  }
}
