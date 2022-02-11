import 'package:get/get.dart';
import 'package:ugaoo/Controller/bottomNavController.dart';

class BottomNavBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController());
  }
}
