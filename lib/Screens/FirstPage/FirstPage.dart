import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ugaoo/Screens/FirstPage/customButton.dart';
import 'package:ugaoo/misc/colors.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = new AnimationController(
        vsync: this, duration: Duration(seconds: 1), value: 0.1);
    _animation = new CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();
  }

  @override
  void didChangeDependencies() {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                      child: ScaleTransition(
                        scale: _animation,
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
                  ),
                  Flexible(
                      flex: 1,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 40.0),
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: CustomButton(
                                pageValue: 0,
                                pageContext: context,
                                name: "Get Started",
                              )))),
                ],
              )),
        ),
      ),
    );
  }
}
