import 'package:get/get.dart';
import 'package:ugaoo/Controller/Auth/authController.dart';
import 'package:ugaoo/Model/userModel.dart';

class UserController extends GetxController {
  Rx<UserModel> _userModel = UserModel().obs;

  UserModel get userData => _userModel.value;
  late RxInt _cartCount = 0.obs;

  set userData(UserModel val) => this._userModel.value = val;

  String? get userName => userData.userName;
  String? get userEmail => userData.userEmail;
  String? get userPhone => userData.userPhone;
  Map<String?, dynamic>? get cartItems => userData.userCartItems;
  List? get favItems => userData.favItems;
  List<Address>? get addressList => userData.getAddress;

  List<CartModel>? get cartOrderIDs => userData.userCartItems!.entries
      .map((e) => CartModel(orderID: e.key, qty: e.value))
      .toList();

  int? get totalCartItems => _cartCount.value;

  @override
  void onReady() {
    if (cartItems != null) _cartCount.value = cartItems!.length;

    //NEED TO CHECK THIS
    super.onInit();
  }

  void clear() {
    _userModel.value = UserModel();
    _cartCount.value = 0;
  }

  bool cartDataItems(CartModel item) {
    try {
      cartItems!.containsKey(item.orderID)
          ? cartItems![item.orderID]++
          : cartItems![item.orderID] = 1;
      _cartCount.value = cartItems!.length;
      return true;
    } catch (e) {
      return false;
    }
  }

  bool updateFavList(String? orderID) {
    try {
      if (favItems == null)
        userData.setList();
      else if (favItems!.contains(orderID))
        favItems!.remove(orderID);
      else
        favItems?.add(orderID);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool updateUserAddress(List<Address> address) {
    try {
      _userModel.value.setUserAddress(address);
      return true;
    } catch (e) {
      return false;
    }
  }

  void addData(CartModel item) async {
    AuthController.instance.updateCartItemsInDatabase(item);
    _cartCount.value = cartItems!.length;
  }

  bool get isCartEmpty =>
      (cartItems == null || totalCartItems == 0) ? true : false;

  // int? get getLength => isCartEmpty ? 0 : totalCartItems;

  int? getLength() {
    return _userModel.value.userCartItems?.length;
  }

  bool deleteCartDataItem(CartModel item) {
    try {
      userData.userCartItems!.remove(item.orderID);
      _cartCount.value = cartItems!.length;
      return true;
    } catch (e) {
      return false;
    }
  }

  RxBool isFav(String? orderID) {
    print("inside");
    return userData.favItems!.contains(orderID) ? true.obs : false.obs;
  }
}
