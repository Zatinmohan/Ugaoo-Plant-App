import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/OnBoarding/onBoarding_controller.dart';
import 'package:ugaoo/misc/colors.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OnBoardingController _controller = Get.put(OnBoardingController());
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller.pageController,
              onPageChanged: _controller.selectedPageIndex,
              itemCount: _controller.onBoardingPages.length,
              itemBuilder: (contex, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(_controller.onBoardingPages[index].image,
                          height: width * 0.9),
                      SizedBox(height: 7.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _controller.onBoardingPages[index].title,
                            style: TextStyle(
                              color: kHeadingTextColor,
                              fontSize: width * 0.1,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            _controller.onBoardingPages[index].description,
                            style: TextStyle(
                              color: kDeailHeadingColor,
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              bottom: 20.0,
              left: 20.0,
              child: Row(
                children: List.generate(
                    _controller.onBoardingPages.length,
                    (index) => Obx(() => Container(
                          height: 12.0,
                          width: 12.0,
                          margin: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _controller.selectedPageIndex.value == index
                                ? kBackgroundColor
                                : kDeailHeadingColor,
                          ),
                        ))),
              ),
            ),
            Positioned(
                bottom: 20.0,
                right: 20.0,
                child: FloatingActionButton(
                  onPressed: _controller.nextPage,
                  backgroundColor: kBackgroundColor,
                  elevation: 0.0,
                  child: Text("Next"),
                )),
          ],
        ),
      ),
    );
  }
}
