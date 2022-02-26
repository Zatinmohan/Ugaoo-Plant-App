import 'package:get/get.dart';
import 'package:ugaoo/Controller/User/UserController.dart';
import 'package:ugaoo/Controller/Auth/authController.dart';
import 'package:ugaoo/Model/userModel.dart';

class AddressController extends GetxController {
  //Stores Address Details
  RxList<Address>? _addressList = RxList();

  //Stores Selected Address
  RxInt _selectIndex = 0.obs;
  RxInt editAddressIndex = 0.obs;

  RxBool isAddressEdit = false.obs;

  @override
  void onInit() {
    _addressList!.value = Get.find<UserController>().addressList!;
    super.onInit();
  }

  List<Address>? get savedAddress => _addressList!;

  int get totalAddress => _addressList!.length;

  int get selectIndexValue => _selectIndex.value;

  void changeValue(int? value) {
    if (value != null) _selectIndex.value = value;
  }

  void setData(int index, bool status) {
    if (status) {
      editAddressIndex.value = index;
      isAddressEdit.value = status;
    } else
      isAddressEdit.value = status;

    Get.toNamed('/Address/NewAddress');
  }

  bool updateExistingAddress(Address changedAddress) {
    try {
      _addressList![editAddressIndex.value] = changedAddress;
      AuthController.instance.updateUserAddressList(_addressList!);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool addNewAddress(Address newAddress) {
    try {
      _addressList!.add(newAddress);
      AuthController.instance.updateUserAddressList(_addressList!);
      return true;
    } catch (e) {
      return false;
    }
  }

  List<Map<String, dynamic>> dataToListOfMap() {
    List<Map<String, dynamic>> temp = [];

    for (int i = 0; i < _addressList!.length; i++) {
      temp[i]["name"] = _addressList![i].addressName;
      temp[i]["city"] = _addressList![i].addressCity;
      temp[i]["flat"] = _addressList![i].addressFlat;
      temp[i]["landmark"] = _addressList![i].landmark;
      temp[i]["phone"] = _addressList![i].addressPhone;
      temp[i]["pincode"] = _addressList![i].addressPincode;
      temp[i]["state"] = _addressList![i].addressState;
      temp[i]["street"] = _addressList![i].addressStreet;
      temp[i]["type"] = _addressList![i].addressType;
    }

    return temp;
  }
}
