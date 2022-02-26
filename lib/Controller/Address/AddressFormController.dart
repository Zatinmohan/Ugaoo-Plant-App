import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/Address/AddressController.dart';
import 'package:ugaoo/Controller/Address/pincodeAPI.dart';
import 'package:ugaoo/Model/userModel.dart';

class AddressFormController extends GetxController {
  Rx<Address> address = Address().obs;
  late final GlobalKey<FormState> addressFormKey;
  RxString addressType = "None".obs;

  late TextEditingController city,
      state,
      name,
      phone,
      pincode,
      house,
      street,
      landmark;

  @override
  void onInit() {
    address.value = Get.find<AddressController>()
        .savedAddress![Get.find<AddressController>().editAddressIndex.value];

    addressFormKey = GlobalKey<FormState>();
    city = TextEditingController();
    state = TextEditingController();
    name = TextEditingController();
    phone = TextEditingController();
    pincode = TextEditingController();
    house = TextEditingController();
    street = TextEditingController();
    landmark = TextEditingController();

    checkPageStatus();

    super.onInit();
  }

  void checkPageStatus() {
    if (Get.find<AddressController>().isAddressEdit.isTrue) setValues();
  }

  String? validator1(String? value) {
    if (value == null || value.isEmpty) return "* Required";
    return null;
  }

  void setValues() {
    state.text = address.value.addressState!;
    name.text = address.value.addressName!;
    phone.text = address.value.addressPhone.toString();
    pincode.text = address.value.addressPincode.toString();
    house.text = address.value.addressFlat!;
    street.text = address.value.addressStreet!;
    city.text = address.value.addressCity!;
    landmark.text =
        address.value.landmark == null ? '' : address.value.landmark!;

    addressType.value = address.value.addressType!;
  }

  void getStateAndCity(var pincode) {
    Get.put(PincodeAPI());
    if (pincode == null || pincode.length < 6)
      Get.snackbar("Incorrect Pincode", "Enter a correct pincode",
          snackPosition: SnackPosition.BOTTOM);
    else {
      Get.find<PincodeAPI>().fetchData(pincode);
      state.text = Get.find<PincodeAPI>().getState;
      city.text = Get.find<PincodeAPI>().getCity;
    }
  }

  void validateForm() {
    Address _updatedAddress = Address(
      name: name.text,
      phoneNo: int.parse(phone.text),
      pincode: int.parse(pincode.text),
      state: state.text,
      flat: house.text,
      landmark: landmark.text,
      city: city.text,
      street: street.text,
      addressType: addressType.value,
    );
    if (addressFormKey.currentState!.validate()) {
      addressFormKey.currentState!.save();
      if (Get.find<AddressController>().isAddressEdit.isTrue &&
              Get.find<AddressController>()
                  .updateExistingAddress(_updatedAddress) ||
          (Get.find<AddressController>().isAddressEdit.isFalse &&
              Get.find<AddressController>().addNewAddress(_updatedAddress)))
        Get.back();
      else
        Get.snackbar("Error!",
            "Can't Update the address. Please check you internet connection.",
            snackPosition: SnackPosition.BOTTOM);
    }
  }
}
