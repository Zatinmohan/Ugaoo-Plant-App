import 'package:get/get.dart';
import 'package:ugaoo/Controller/MainPage/mainPageController.dart';

class MainPageDataBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainPageController>(() => MainPageController());
  }
}
