import 'package:flutter/material.dart';
import 'package:ugaoo/misc/colors.dart';

class LikePage extends StatelessWidget {
  const LikePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/misc/soon.png"),
              Text(
                "Comming Soon!",
                style: TextStyle(
                  color: kHeadingTextColor,
                  fontSize: width * 0.1,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          )),
      // bottomNavigationBar: customBottomNavigationBar(),
    );
  }
}
