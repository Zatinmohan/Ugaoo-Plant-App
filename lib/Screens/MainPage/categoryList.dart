import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/MainPage/mainPageController.dart';
import 'package:ugaoo/misc/colors.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<MainPageController>();
    return Container(
      height: 55.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _controller.mainCategory.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.all(10.0),
            child: GestureDetector(
                onTap: () {
                  _controller.setIndexValue(index);
                },
                child: Obx(
                  () => Container(
                    width: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: index == _controller.categoryIndex.value
                          ? kBackgroundColor
                          : ksecondaryBackgroundColor,
                    ),
                    padding: EdgeInsets.all(5.0),
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text("${_controller.mainCategory[index]}",
                            style: TextStyle(
                              color: index == _controller.categoryIndex.value
                                  ? Colors.white
                                  : kBackgroundColor,
                              fontWeight: FontWeight.w600,
                              fontSize: width * 0.05,
                            )),
                      ),
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}
