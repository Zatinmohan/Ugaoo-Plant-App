import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:ugaoo/pages/home_page/domain/entities/categories_entities/product_category_entity.dart';
import 'package:ugaoo/pages/home_page/domain/usecases/fetch_product_categories_usecase.dart';

const String _logName = "Home Page Provider";

class HomePageProvider extends ChangeNotifier {
  final FetchProductCategoriesUsecase _categoriesUsecase;
  bool _isLoading = false;
  ProductCategoryEntity? categoryData;

  HomePageProvider({required FetchProductCategoriesUsecase categoriesUsecase})
      : _categoriesUsecase = categoriesUsecase {
    log("Home page Provider Init", name: _logName);
  }

bool get isLoading => _isLoading;
  void _setLoadingState(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future<void> fetchProductCategories() async {
    try {
      _setLoadingState(true);
      categoryData = await _categoriesUsecase.fetchProductCategories();
      _setLoadingState(false);
    } catch (error) {
      rethrow;
    }
  }

  @override
  void dispose() {
    log("Home page Provider Dispose", name: _logName);
    super.dispose();
  }
}
