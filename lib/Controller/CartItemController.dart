import 'package:get/get.dart';
import 'package:ugaoo/Model/AddressDummy.dart';
import 'package:ugaoo/Model/dummy.dart';

class CartItemController extends GetxController {
  List<Dummy> cartItems = cartList.obs;
  List<AddressDummy> addressList = dummyAddressList.obs;
  RxInt? addressIndex = 0.obs;
  RxInt appPoints = 50.obs;

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

  addToCart(data) {
    cartList.add(data);
    cartItems.add(data);
  }

  removeFromCart(data) {
    cartList.removeAt(data);
    cartItems.removeAt(data);
  }
}
