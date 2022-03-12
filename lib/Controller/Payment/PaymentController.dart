import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/Address/AddressController.dart';
import 'package:ugaoo/Controller/Cart/CartController.dart';
import 'package:ugaoo/Model/ProductModel.dart';
import 'package:ugaoo/Model/userModel.dart';
import 'package:ugaoo/misc/bankList.dart';

class PaymentController extends GetxController {
  RxList<ProductList> _cartItems = RxList<ProductList>();
  Rx<Address> _deliveryTo = Address().obs;
  RxInt _appPoints = 800.obs;
  RxBool appPointCheckbox = false.obs;

  RxString? bankName = bankNames[0].obs;
  RxBool cod = false.obs;
  late GlobalKey<FormState> upi, cardPayment, netbanking;

  @override
  void onInit() {
    _setData();
    super.onInit();
  }

  void _setData() {
    upi = GlobalKey<FormState>();
    cardPayment = GlobalKey<FormState>();
    netbanking = GlobalKey<FormState>();
    _cartItems.value = Get.find<CartController>().cartData!;
    _deliveryTo.value = Get.find<AddressController>().getSelectedAdress;
  }

  //App Points Functionality
  int get appPoints => _appPoints.value;

  checkAppPoints(bool? val) {
    if (_appPoints.value == 0)
      return null;
    else {
      appPointCheckbox.value = val!;
    }
  }

  // Getters for Selected Address
  String get deliveryTo => _deliveryTo.value.addressName!;
  int get pincode => _deliveryTo.value.addressPincode!;
  int get phone => _deliveryTo.value.addressPhone!;
  String get houseNumber => _deliveryTo.value.addressFlat!;
  String get street => _deliveryTo.value.addressStreet!;
  String get state => _deliveryTo.value.addressState!;
  String get city => _deliveryTo.value.addressCity!;
  String get addressType => _deliveryTo.value.addressType!;
  String get landmark => _deliveryTo.value.landmark!;

  //CartFunctions
  int totalPrice() {
    int totalPrice = 0;
    _cartItems.forEach((element) {
      totalPrice += element.productPrice!;
    });
    return totalPrice;
  }

  //Payment Validators
  String? netbankingValidator(String? val) {
    if (val == null || val == "Select a Bank" || val.isEmpty)
      return "Select a bank";
    return null;
  }

  String? cardPaymentValidator(var val) {
    if (val == null || val.length < 16) return "Incorrect Card number";
    return null;
  }

  String? dateValidator(var val) {
    if (val == null || val.length < 4) return "Incorrect Date";
    return null;
  }

  String? cvvValidator(var val) {
    if (val == null || val.length < 3) return "Incorrect CVV";
    return null;
  }

  String? upiValidator(var value) {
    if (value != null &&
        (value.isEmpty == true || value.contains("@") == false))
      return "Incorrect UPI";
    return null;
  }

  void validatePayment() {
    if (cardPayment.currentState?.validate() == true ||
        upi.currentState?.validate() == true ||
        netbanking.currentState?.validate() == true ||
        (appPointCheckbox.isTrue &&
            _appPoints.value >= Get.find<CartController>().getPrice()))
      Get.toNamed('/Placed');
    else if (cardPayment.currentState?.validate() == false ||
        upi.currentState?.validate() == false ||
        netbanking.currentState?.validate() == false ||
        cod.value == false)
      Get.snackbar("Payment Error!", "Choose Payment Method",
          snackPosition: SnackPosition.BOTTOM);
  }
}
