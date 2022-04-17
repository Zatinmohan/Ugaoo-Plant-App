import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/Product/ProductController.dart';
import 'package:ugaoo/Model/ProductModel.dart';

class SearchBarController extends GetxController {
  late TextEditingController searchBar;
  RxList<ProductList> dummyList = RxList<ProductList>();
  RxList<ProductList> searchHistory = RxList<ProductList>();
  @override
  void onInit() {
    searchHistory.value = Get.find<ProductController>().getProduct!;
    dummyList = searchHistory;
    searchBar = TextEditingController();

    super.onInit();
  }

  bool get isListEmpty => searchHistory.isEmpty ? true : false;

  onItemChange(String data) {
    dummyList = searchHistory;
    if (data.isNotEmpty) {
      List<ProductList> tempData = [];
      searchHistory.forEach((element) {
        if (element.productName!.toLowerCase().contains(data.toLowerCase())) {
          tempData.add(element);
        }
      });
      dummyList.value = tempData;
    } else
      dummyList = searchHistory;
  }
}
