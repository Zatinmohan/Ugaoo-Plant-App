import 'package:get/get.dart';
import 'package:ugaoo/Model/userModel.dart';

class UserController extends GetxController {
  Rx<UserModel> _userModel = UserModel().obs;

  UserModel get userData => _userModel.value;

  set userData(UserModel val) => this._userModel.value = val;

  void clear() {
    _userModel.value = UserModel();
  }
}
