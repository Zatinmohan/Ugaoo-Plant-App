import 'package:flutter/material.dart';
import 'package:ugaoo/pages/cart_page/views/cart_page.dart';
import 'package:ugaoo/pages/home_page/views/home_page.dart';
import 'package:ugaoo/pages/like_page/views/like_page.dart';
import 'package:ugaoo/pages/profile_page/views/profile_page.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int index;
  final List<Widget> homePageWidgets = [
    const HomePage(),
    const LikePage(),
    const CartPage(),
    const ProfilePage(),
  ];

  BottomNavigationProvider({int? index}) : this.index = index ?? 0;

  void onTap(int index) {
    this.index = index;
    notifyListeners();
  }
}
