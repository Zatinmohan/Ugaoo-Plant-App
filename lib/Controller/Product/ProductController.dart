import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ugaoo/Model/ProductModel.dart';

class ProductController extends GetxController {
  PageController controller = PageController();
  Rx<int> _pageIndex = 0.obs;
  Rx<bool> _pincodeField = false.obs;

  Rx<ProductModel> _productData = ProductModel().obs;
  Rx<int> _selectedProduct = 0.obs;

  List<ProductList>? get getProduct => _productData.value.productList;

  set setProduct(ProductModel val) => this._productData.value = val;

  set tappedProduct(int index) => this._selectedProduct.value = index;

  int get getTappedProduct => _selectedProduct.value;

  List<ProductList> getSelectedItems(String subCategory) {
    List<ProductList> temp = [];
    for (int i = 0; i < _productData.value.productList!.length; i++) {
      if (_productData.value.productList![i].productSubCategory!
              .compareTo(subCategory) ==
          0) {
        temp.add(_productData.value.productList![i]);
      }
    }

    return temp;
  }

  void pageChange(int n) {
    _pageIndex.value = n;
  }

  int get pageIndex => _pageIndex.value;

  void changePincodeField() {
    _pincodeField.value = !_pincodeField.value;
  }

  bool checkPincodeField() => _pincodeField.value;

  //Product Getter Methods
  String? get productName => getProduct![_selectedProduct.value].productName;

  String? get productDescription =>
      getProduct![_selectedProduct.value].productDescription;

  int? get productPrice => getProduct![_selectedProduct.value].productPrice;

  String? get productImage => getProduct![_selectedProduct.value].productImage;

  List<dynamic>? get productRequirement =>
      getProduct![_selectedProduct.value].productRequirement;

  Map<String, dynamic>? get productEssential =>
      getProduct![_selectedProduct.value].productEssential;

  Map<String, dynamic>? get productProblems =>
      getProduct![_selectedProduct.value].productProblems;

  String? get productID => getProduct![_selectedProduct.value].productID;
}
