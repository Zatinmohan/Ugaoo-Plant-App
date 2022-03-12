import 'package:get/get.dart';
import 'package:ugaoo/Controller/Auth/authController.dart';
import 'package:ugaoo/Controller/Cart/CartController.dart';
import 'package:ugaoo/Model/userModel.dart';

class UserController extends GetxController {
  Rx<UserModel> _userModel = UserModel().obs;

  UserModel get userData => _userModel.value;
  late RxInt _cartCount = 0.obs;

  RxList _likedProduct = [].obs;
  RxMap<dynamic, dynamic> _cartItemsUser = {}.obs;

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
    _likedProduct.value = favItems ?? [];
    _cartItemsUser.value = cartItems ?? {};

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
      _cartItemsUser.containsKey(item.orderID)
          ? _cartItemsUser[item.orderID]++
          : _cartItemsUser[item.orderID] = 1;
      _cartCount.value = _cartItemsUser.length;
      return true;
    } catch (e) {
      return false;
    }
  }

  bool addCartItemQty(CartModel item) {
    try {
      _cartItemsUser[item.orderID]++;
      Get.find<CartController>().getPrice();
      return true;
    } catch (e) {
      return false;
    }
  }

  bool subCartItemQty(CartModel item) {
    try {
      if (_cartItemsUser[item.orderID] == 1)
        return false;
      else {
        _cartItemsUser[item.orderID]--;
        Get.find<CartController>().getPrice();
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  bool updateFavList(String? orderID) {
    try {
      if (favItems == null)
        userData.setList();
      else if (favItems!.contains(orderID)) {
        _likedProduct.remove(orderID);
      } else {
        _likedProduct.add(orderID);
      }
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
    if (cartItems != null) _cartCount.value = cartItems!.length;
  }

  bool get isCartEmpty =>
      (cartItems == null || totalCartItems == 0) ? true : false;

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

  RxBool checkLikedList(String? orderID) =>
      _likedProduct.contains(orderID) ? true.obs : false.obs;

  List get likedProductList => _likedProduct;

  Map<dynamic, dynamic> get userCartList => _cartItemsUser;
}
