import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ugaoo/pages/bottom_navigation_page/dependency_injection/bottom_navigation_dependency_injection.dart';
import 'package:ugaoo/pages/bottom_navigation_page/provider/bottom_nav_provider.dart';
import 'package:ugaoo/pages/cart_page/views/cart_page.dart';
import 'package:ugaoo/pages/home_page/views/home_page.dart';
import 'package:ugaoo/pages/like_page/views/like_page.dart';
import 'package:ugaoo/pages/profile_page/views/profile_page.dart';

class BottomNavigationPage extends ConsumerWidget {
  BottomNavigationPage({super.key});

  final List<Widget> pages = [
    const HomePage(),
    const LikePage(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _bottomProvider = ref.watch<BottomNavigationProvider>(
      BottomNavigationDependencyInjection.bottomNavigationProvier,
    );
    return Scaffold(
      body: pages[_bottomProvider.index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomProvider.index,
        onTap: (index) => ref
            .read(
              BottomNavigationDependencyInjection.bottomNavigationProvier,
            )
            .onTap(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Like",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
