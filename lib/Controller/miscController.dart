import 'package:get/get.dart';

//Controllers that can't be used in other classes.
class MiscController extends GetxController {
  var index = 0.obs;
  var page = false.obs;
  RxBool cod = false.obs;
  RxBool points = false.obs;
}
