import 'package:get/get.dart';
import 'package:ugaoo/Controller/Auth/loginFormController.dart';

class LoginControllerBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
