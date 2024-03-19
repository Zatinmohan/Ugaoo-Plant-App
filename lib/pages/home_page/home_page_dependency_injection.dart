import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ugaoo/dependency_injection/global_dependency_injections.dart';
import 'package:ugaoo/pages/home_page/data/repositories_impl/home_page_repo_impl.dart';
import 'package:ugaoo/pages/home_page/domain/usecases/fetch_product_categories_usecase.dart';
import 'package:ugaoo/pages/home_page/domain/usecases/fetch_products_usecase.dart';
import 'package:ugaoo/pages/home_page/states/category_controllers/home_page_category_notifier.dart';
import 'package:ugaoo/pages/home_page/states/category_controllers/home_page_category_states.dart';
import 'package:ugaoo/pages/home_page/states/home_data_controllers/home_page_data_notifier.dart';
import 'package:ugaoo/pages/home_page/states/home_data_controllers/home_page_data_states.dart';
import 'package:ugaoo/services/api/api_provider.dart';

class HomePageDependencyInjection {
  static final homepageRepoImpl = Provider<HomePageRepoImpl>((ref) {
    return HomePageRepoImpl(
      provider: ref.read<ApiProvider>(GlobalDependencyInjection.apiProvider),
    );
  });

  static final fetchProductDataUsecase =
      Provider<FetchProductDataUsecase>((ref) {
    return FetchProductDataUsecase(repo: ref.read(homepageRepoImpl));
  });

  static final fetchProductCategoryUsecaseProvider =
      Provider<FetchProductCategoriesUsecase>((ref) {
    return FetchProductCategoriesUsecase(
      repo: ref.read(homepageRepoImpl),
    );
  });

  static final homepageCategoryProvider =
      AsyncNotifierProvider<HomePageCategoryNotifier, HomepageCategoryState>(
    HomePageCategoryNotifier.new,
  );

  static final homepageProductProvider =
      AsyncNotifierProvider<HomePageDataNotifier, HomePageDataStates>(
    HomePageDataNotifier.new,
  );
}
