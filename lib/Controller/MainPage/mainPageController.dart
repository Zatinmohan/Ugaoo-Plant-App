import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Controller/Product/ProductController.dart';
import 'package:ugaoo/Model/ProductModel.dart';
import 'package:ugaoo/misc/categoryList.dart';

class MainPageController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController;
  RxList<ProductList> productList = RxList<ProductList>();
  RxInt categoryIndex = 0.obs;
  RxList<Widget> productPages = CategoryList.categoryList.seedsPages.obs;

  RxList<Tab> dataNameList = CategoryList.categoryList.subSeeds.obs;

  final _productController = Get.find<ProductController>();

  @override
  void onInit() {
    productList.value = _productController.getSelectedItems("Winter Season");
    tabController = TabController(length: productPages.length, vsync: this);

    tabController.addListener(() {
      if (tabController.index == 0) {
        productList.value =
            _productController.getSelectedItems("Winter Season");
      } else if (tabController.index == 1) {
        productList.value =
            _productController.getSelectedItems("Summer Season");
      } else {
        productList.value = _productController.getSelectedItems("Easy to grow");
      }
    });

    super.onInit();
  }

  void getMultipleTabsData() {
    switch (categoryIndex.value) {
      case 0:
        dataNameList.value = CategoryList.categoryList.subSeeds;
        productPages.value = CategoryList.categoryList.seedsPages;
        tabController.dispose();
        tabController = TabController(length: productPages.length, vsync: this);

        tabController.addListener(() {
          if (tabController.index == 0) {
            productList.value =
                _productController.getSelectedItems("Winter Season");
          } else if (tabController.index == 1) {
            productList.value =
                _productController.getSelectedItems("Summer Season");
          } else {
            productList.value =
                _productController.getSelectedItems("Easy to grow");
          }
        });
        break;
      case 1:
        dataNameList.value = CategoryList.categoryList.subPlants;
        productPages.value = CategoryList.categoryList.plantPages;
        tabController.dispose();
        tabController = TabController(length: productPages.length, vsync: this);

        tabController.addListener(() {
          if (tabController.index == 0) {
            productList.value =
                _productController.getSelectedItems("Air Purifier");
          } else if (tabController.index == 1) {
            productList.value =
                _productController.getSelectedItems("Foliage Pattern");
          } else if (tabController.index == 2) {
            productList.value = _productController.getSelectedItems("Indoor");
          }
        });

        break;
      case 2:
        dataNameList.value = CategoryList.categoryList.subPots;
        productPages.value = CategoryList.categoryList.potPages;
        tabController.dispose();
        tabController = TabController(length: productPages.length, vsync: this);

        break;
      case 3:
        dataNameList.value = CategoryList.categoryList.subTools;
        break;
      default:
        dataNameList.value = [];
    }
  }

  void setIndexValue(int index) {
    categoryIndex.value = index;
    getMultipleTabsData();
  }

  List<String> get mainCategory => CategoryList.categoryList.mainCategories;

  bool get tabListLength => dataNameList.length != 0 ? true : false;
}
