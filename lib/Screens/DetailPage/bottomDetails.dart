import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/Product/ProductController.dart';
import 'package:ugaoo/Screens/DetailPage/Desciptions/description.dart';
import 'package:ugaoo/Screens/DetailPage/Desciptions/otherDescription.dart';
import 'package:ugaoo/misc/colors.dart';

class BottomDetails extends StatelessWidget {
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
              controller: Get.find<ProductController>().controller,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              onPageChanged: (n) => Get.find<ProductController>().pageChange(n),
              itemBuilder: (context, position) {
                return SingleChildScrollView(
                  child: Container(
                    child: position == 0
                        ? ProductDescription(
                            title: "Description",
                            content: Get.find<ProductController>()
                                .productDescription,
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
                      color: Get.find<ProductController>().pageIndex == index
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
