import 'package:get/get.dart';
import 'package:ugaoo/Controller/Cart/CartController.dart';

class CartItemBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController());
  }
}
