import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

//This class is used to check if the application is installed for the first time or not.
// If first time installed, then it will show the on-boarding page, else directly login page.
class MyPref extends GetxController {
  final box =
      GetStorage(); //Provided by Get_Storage lib, used as shared preference.

  //If newly installed, then set the shared pref to false, and return true; else false

  @override
  void onInit() {
    if (box.read('firstInstall') == null) box.write('firstInstall', true);
    super.onInit();
  }

  String checkFirstPage() {
    if (box.read('firstInstall') == true) {
      box.write('firstInstall', false);
      return "/";
    } else
      return "/Login";
  }
}
