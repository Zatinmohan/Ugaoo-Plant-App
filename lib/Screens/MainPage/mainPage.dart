import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/BottomNav/bottomNavController.dart';
import 'package:ugaoo/Controller/MainPage/mainPageController.dart';
import 'package:ugaoo/Screens/MainPage/SearchBar.dart';
import 'package:ugaoo/Screens/MainPage/categoryList.dart';
import 'package:ugaoo/misc/bottomNavigationBar.dart';
import 'package:ugaoo/misc/colors.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<MainPageController>();
    Get.find<BottomNavController>().index.value = 0;
    return Obx(() => Scaffold(
        appBar: AppBar(
            elevation: 4.0,
            backgroundColor: Colors.white,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(height * 0.40),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchBar(),
                    SizedBox(height: height * 0.05),
                    Text(
                      "Categories",
                      style: TextStyle(
                          color: kHeadingTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: width * 0.07),
                    ),
                    SizedBox(height: 10.0),
                    CategoryList(),
                    SizedBox(height: 10.0),
                    TabBar(
                      controller: _controller.tabController,
                      isScrollable: true,
                      indicatorColor: kBackgroundColor,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: _controller.dataNameList.value,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: width * 0.045,
                      ),
                      labelColor: kHeadingTextColor,
                      unselectedLabelColor: kBackgroundColor,
                    ),
                  ],
                ),
              ),
            )),
        body: TabBarView(
          controller: _controller.tabController,
          children: _controller.productPages,
        ),
        bottomNavigationBar: customBottomNavigationBar()));
  }
}
