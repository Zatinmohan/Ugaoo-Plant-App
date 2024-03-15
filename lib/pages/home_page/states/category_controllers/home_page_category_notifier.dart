import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ugaoo/pages/home_page/domain/entities/categories_entities/home_page_category_entity.dart';
import 'package:ugaoo/pages/home_page/domain/usecases/fetch_product_categories_usecase.dart';
import 'package:ugaoo/pages/home_page/home_page_dependency_injection.dart';
import 'package:ugaoo/pages/home_page/states/category_controllers/home_page_category_states.dart';

const String _logName = "Home Page Provider";

class HomePageCategoryNotifier extends AsyncNotifier<HomepageCategoryState> {
  late final FetchProductCategoriesUsecase _categoriesUsecase;

  @override
  HomepageCategoryState build() {
    _categoriesUsecase = ref.read<FetchProductCategoriesUsecase>(
      HomePageDependencyInjection.fetchProductUsecaseProvider,
    );
    return const HomepageCategoryState.initial();
  }

  HomePageCategoryNotifier() {
    log("Home page Provider Init", name: _logName);
  }

  Future<void> fetchProductCategories() async {
    try {
      state =
          const AsyncValue.data(HomepageCategoryState.categoryLoadingState());
      final HomePageCategoryEntity? categoryData =
          await _categoriesUsecase.fetchProductCategories();
      state = AsyncValue.data(
        HomepageCategoryState.categoryLoadedState(
          categoriesData: categoryData!,
        ),
      );
    } catch (error) {
      rethrow;
    }
  }
}
