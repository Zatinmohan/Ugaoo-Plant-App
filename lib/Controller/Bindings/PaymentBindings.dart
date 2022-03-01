import 'package:get/get.dart';
import 'package:ugaoo/Controller/Payment/PaymentController.dart';

class PaymentBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentController>(() => PaymentController());
  }
}
