import 'package:get/get.dart';
import 'package:ugaoo/Controller/Product/ProductController.dart';
import 'package:ugaoo/Controller/User/UserController.dart';
import 'package:ugaoo/Controller/Auth/authController.dart';
import 'package:ugaoo/Model/ProductModel.dart';
import 'package:ugaoo/Model/userModel.dart';

class CartController extends GetxController {
  RxList<ProductList>? _cartItems = RxList();
  RxList<CartModel>? cartItemsID = RxList();

  RxInt _totalPrice = 0.obs;
  RxInt _totalItems = 0.obs;

  RxInt appPoints = 50.obs;

  @override
  void onInit() {
    _fetchDetails();
    super.onInit();
  }

  _fetchDetails() {
    cartItemsID?.value = Get.find<UserController>().cartOrderIDs!;

    if ((cartItemsID != null || cartItemsID?.length != 0)) {
      List<ProductList>? temp = Get.find<ProductController>().getProduct;

      _cartItems = RxList.from(temp!
          .where((element) =>
              cartItemsID!.any((e) => e.orderID == element.productID))
          .toList());

      _totalPrice.value = cartProductPrice();
      _totalItems.value = updateItemCount();
    }
  }

  List<ProductList>? get cartData => _cartItems;

  bool get isEmpty =>
      (_cartItems == null || _cartItems!.isEmpty) ? true : false;

  int get cartLength => _totalItems.value;

  int updateItemCount() {
    return _cartItems!.length;
  }

  int cartProductPrice() {
    int sum = 0;
    _cartItems!.forEach((element) {
      sum += element.productPrice!;
    });
    return sum;
  }

  int get getPrice => _totalPrice.value;

  String? getOrderID(int index) {
    return _cartItems![index].productID;
  }

  void removeDataFromCart(CartModel item) {
    AuthController.instance.removeCartItemInDatabase(item);
    _fetchDetails();
    update();
  }

  void addQuantity(CartModel item) {
    AuthController.instance.updateCartItemQty(item, true);
  }

  void subQuantity(CartModel item) {
    AuthController.instance.updateCartItemQty(item, true);
  }
}
