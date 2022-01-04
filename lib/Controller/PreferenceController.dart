import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyPref extends GetxController {
  final box = GetStorage();

  bool get firstInstall =>
      (box.read('firstInstall') == null || box.read('firstInstall') == true)
          ? setFirst()
          : false;

  bool setFirst() {
    box.write('firstInstall', false);
    return true;
  }

  String get firstPage => firstInstall ? '/' : '/Login';
}
