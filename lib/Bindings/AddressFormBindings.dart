import 'package:get/get.dart';
import 'package:ugaoo/Controller/Address/AddressFormController.dart';

class AddressFormBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressFormController>(() => AddressFormController());
  }
}
