import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

//This class is used to check if the application is installed for the first time or not.
// If first time installed, then it will show the on-boarding page, else directly login page.
class MyPref extends GetxController {
  final box =
      GetStorage(); //Provided by Get_Storage lib, used as shared preference.

  //If newly installed, then set the shared pref to false, and return true; else false
  bool get firstInstall =>
      (box.read('firstInstall') == null || box.read('firstInstall') == true)
          ? setFirst()
          : false;

  bool setFirst() {
    box.write('firstInstall', false);
    return true;
  }

  //Just a method that returns path for either splash screen or Login Page.
  String get firstPage => firstInstall ? '/' : '/Login';
}
