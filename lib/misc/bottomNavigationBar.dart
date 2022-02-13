import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/bottomNavController.dart';
import 'package:ugaoo/misc/colors.dart';

//Contains the BottomNavBar used in Main Screen

class customBottomNavigationBar extends StatelessWidget {
  const customBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        // selectedItemColor: kBackgroundColor,
        // unselectedItemColor: kDeailHeadingColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: Get.find<BottomNavController>().index.value,
        onTap: Get.find<BottomNavController>().indexChange,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home, color: kBackgroundColor),
          ),
          BottomNavigationBarItem(
              label: "Favorite",
              icon: Icon(Icons.favorite, color: kDeailHeadingColor)),
          BottomNavigationBarItem(
              label: "Cart",
              icon: Icon(Icons.shopping_cart, color: kDeailHeadingColor)),
          BottomNavigationBarItem(
              label: "Account",
              icon: Icon(Icons.person_rounded, color: kDeailHeadingColor)),
        ],
      ),
    );
  }
}
