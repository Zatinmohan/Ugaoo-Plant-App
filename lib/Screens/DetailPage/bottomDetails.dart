import 'package:flutter/material.dart';
import 'package:ugaoo/Screens/DetailPage/Desciptions/description.dart';
import 'package:ugaoo/Screens/DetailPage/Desciptions/otherDescription.dart';
import 'package:ugaoo/misc/colors.dart';

class BottomDetails extends StatefulWidget {
  const BottomDetails({Key? key}) : super(key: key);

  @override
  State<BottomDetails> createState() => _BottomDetailsState();
}

class _BottomDetailsState extends State<BottomDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Container(
        height: height * 0.5,
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, position) {
            return Container(
              child: position == 0
                  ? ProductDescription(
                      title: "Description",
                      content:
                          "Chlorophytum Spider, also the Spider Plant is an impressive indoor plant and perfect for beginners. It is not only easy to care for but also a NASA certified air purifier. Its long, green foliage with white variegations look good in both hanging planters and as desktop setups. In favourable conditions, it blooms with small white flowers and its pups grow on stems cascading from the plant.",
                    )
                  : (position == 1)
                      ? OtherDetails(
                          heading: "Plant Essential",
                        )
                      : OtherDetails(
                          heading: "Common Problems",
                        ),
            );
          },
        ),
      ),
    );
  }
}
