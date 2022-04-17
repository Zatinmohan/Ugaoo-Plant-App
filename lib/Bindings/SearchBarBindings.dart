import 'package:get/get.dart';
import 'package:ugaoo/Controller/SearchBar/searchController.dart';

class SearchBarBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchBarController>(() => SearchBarController());
  }
}
