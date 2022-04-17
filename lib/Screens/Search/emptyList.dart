import 'package:flutter/material.dart';
import 'package:ugaoo/misc/colors.dart';

class ListEmpty extends StatelessWidget {
  const ListEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Image.asset("assets/misc/emptyList.png"),
    );
  }
}
