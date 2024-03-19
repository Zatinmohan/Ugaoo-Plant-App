import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ugaoo/pages/home_page/domain/entities/product_entities/product_data_entity.dart';
import 'package:ugaoo/pages/home_page/domain/usecases/fetch_products_usecase.dart';
import 'package:ugaoo/pages/home_page/home_page_dependency_injection.dart';
import 'package:ugaoo/pages/home_page/states/home_data_controllers/home_page_data_states.dart';

class HomePageDataNotifier extends AsyncNotifier<HomePageDataStates> {
  late final FetchProductDataUsecase _fetchProductDataUsecase;
  @override
  FutureOr<HomePageDataStates> build() {
    _fetchProductDataUsecase =
        ref.read(HomePageDependencyInjection.fetchProductDataUsecase);
    return const HomePageDataStates.initial();
  }

  Future<void> fetchProducts() async {
    try {
      state = const AsyncValue.data(HomePageDataStates.loadingState());
      final ProductDataEntity? data =
          await _fetchProductDataUsecase.fetchProducts();
      state = AsyncData(HomePageDataStates.loadedState(productData: data!));
    } catch (error) {
      rethrow;
    }
  }
}
