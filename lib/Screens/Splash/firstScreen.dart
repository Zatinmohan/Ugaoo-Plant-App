import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ugaoo/misc/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/misc/background.jpg"),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(top: height * 0.1),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/misc/appIcon.png",
                            width: width * 0.4,
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            "UGAOO",
                            style: TextStyle(
                              color: ksecondaryBackgroundColor,
                              fontSize: width * 0.12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CircularProgressIndicator(),
                ],
              )),
        ),
      ),
    );
  }
}
