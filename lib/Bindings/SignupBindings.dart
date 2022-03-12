import 'package:get/get.dart';
import 'package:ugaoo/Controller/Auth/signupController.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());
  }
}
