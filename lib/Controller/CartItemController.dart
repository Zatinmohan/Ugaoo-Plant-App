import 'package:get/get.dart';
import 'package:ugaoo/Model/AddressDummy.dart';
import 'package:ugaoo/Model/dummy.dart';

class CartItemController extends GetxController {
  List<Dummy> cartItems = dummyList.obs;
  List<AddressDummy> addressList = dummyAddressList.obs;
  RxInt? addressIndex = 0.obs;

  int getLength() {
    return cartItems.length;
  }

  getPrice() {
    int v = 0;
    for (int i = 0; i < getLength(); i++) {
      v += cartItems[i].price;
    }

    return v;
  }
}