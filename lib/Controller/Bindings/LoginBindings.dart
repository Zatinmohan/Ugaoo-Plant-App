import 'package:get/get.dart';
import 'package:ugaoo/Controller/loginFormController.dart';

class LoginControllerBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
