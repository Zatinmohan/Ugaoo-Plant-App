import 'package:get/get.dart';
import 'package:ugaoo/Controller/Address/AddressController.dart';

class AddressBingings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressController>(() => AddressController());
  }
}
