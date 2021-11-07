import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/miscController.dart';
import 'package:ugaoo/Screens/DetailPage/Desciptions/description.dart';
import 'package:ugaoo/Screens/DetailPage/Desciptions/otherDescription.dart';
import 'package:ugaoo/misc/colors.dart';

class BottomDetails extends StatefulWidget {
  final PageController? pageController;

  const BottomDetails({Key? key, this.pageController}) : super(key: key);

  @override
  State<BottomDetails> createState() => _BottomDetailsState();
}

class _BottomDetailsState extends State<BottomDetails> {
  final MiscController _miscController = Get.put(MiscController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
      child: Column(
        children: [
          PageIndicatorWidget(),
          Expanded(
            child: Container(
                child: PageView.builder(
              controller: widget.pageController,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              onPageChanged: (n) {
                _miscController.index.value = n;
              },
              itemBuilder: (context, position) {
                return SingleChildScrollView(
                  child: Container(
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
                  ),
                );
              },
            )),
          ),
        ],
      ),
    );
  }
}

class PageIndicatorWidget extends StatelessWidget {
  const PageIndicatorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MiscController _controller = Get.put(MiscController());
    print("Indicator");
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
        child: Container(
            // color: Colors.black,
            height: 10.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Obx(() {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 150),
                    decoration: BoxDecoration(
                      color: _controller.index.value == index
                          ? kBackgroundColor
                          : kDeailHeadingColor,
                      shape: BoxShape.circle,
                    ),
                    child: SizedBox(
                      width: 20.0,
                    ),
                  );
                });
              },
            )));
  }
}
