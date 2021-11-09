import 'package:flutter/material.dart';
import 'package:ugaoo/misc/colors.dart';

class PageIndicator extends StatelessWidget {
  final pageNo;
  const PageIndicator({Key? key, this.pageNo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
          alignment: Alignment.center,
          child: RichText(
              text: TextSpan(
            children: [
              TextSpan(
                  text: "Cart -------------- ",
                  style: TextStyle(
                    color: pageNo == 1 ? kBackgroundColor : kDeailHeadingColor,
                    fontWeight: pageNo == 1 ? FontWeight.bold : FontWeight.w600,
                    fontSize: width * 0.07,
                  )),
              TextSpan(
                  text: " Address -------------- ",
                  style: TextStyle(
                    color: pageNo == 2 ? kBackgroundColor : kDeailHeadingColor,
                    fontWeight: pageNo == 2 ? FontWeight.bold : FontWeight.w600,
                    fontSize: width * 0.07,
                  )),
              TextSpan(
                  text: " Payment",
                  style: TextStyle(
                    color: pageNo == 3 ? kBackgroundColor : kDeailHeadingColor,
                    fontWeight: pageNo == 3 ? FontWeight.bold : FontWeight.w600,
                    fontSize: width * 0.07,
                  )),
            ],
          )),
        ),
      ),
    );
  }
}
