import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var index = 0.obs;

  indexChange(int ind) {
    index.value = ind;
    update();

    switch (ind) {
      case 0:
        Get.toNamed("/Login/Main");
        break;

      case 1:
        Get.toNamed("/Login/Main");
        break;

      case 2:
        Get.toNamed("/Login/Cart");
        break;

      case 3:
        Get.toNamed("/Profile");
        break;

      default:
        break;
    }
  }
}
