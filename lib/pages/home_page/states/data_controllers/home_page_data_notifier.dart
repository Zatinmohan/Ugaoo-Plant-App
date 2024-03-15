import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ugaoo/pages/home_page/states/data_controllers/home_page_data_states.dart';

class HomePageDataNotifier extends AsyncNotifier<HomePageDataStates> {
  @override
  FutureOr<HomePageDataStates> build() {
    return const HomePageDataStates.initial();
  }

  Future<void> fetchProducts() async {
    try {
      state = const AsyncValue.data(HomePageDataStates.loadingState());
      //TODO Fetch Data
      state = const AsyncData(HomePageDataStates.loadedState());
    } catch (error) {}
  }
}
