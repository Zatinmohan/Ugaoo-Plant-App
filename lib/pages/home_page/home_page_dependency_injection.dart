import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ugaoo/dependency_injection/global_dependency_injections.dart';
import 'package:ugaoo/pages/home_page/data/repositories_impl/home_page_repo_impl.dart';
import 'package:ugaoo/pages/home_page/domain/usecases/fetch_product_categories_usecase.dart';
import 'package:ugaoo/pages/home_page/states/home_page_notifier.dart';
import 'package:ugaoo/services/api/api_provider.dart';

class HomePageDependencyInjection {
  static final homepageRepoImpl = Provider<HomePageRepoImpl>((ref) {
    return HomePageRepoImpl(
      provider: ref.read<ApiProvider>(GlobalDependencyInjection.apiProvider),
    );
  });

  static final fetchProductUsecaseProvider =
      Provider<FetchProductCategoriesUsecase>((ref) {
    return FetchProductCategoriesUsecase(
      repo: ref.read(homepageRepoImpl),
    );
  });

  static final homepageProvider = ChangeNotifierProvider<HomePageProvider>(
    (ref) => HomePageProvider(
      categoriesUsecase: ref.read(fetchProductUsecaseProvider),
    ),
  );
}
