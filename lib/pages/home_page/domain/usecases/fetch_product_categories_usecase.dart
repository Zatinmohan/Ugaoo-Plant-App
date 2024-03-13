import 'package:ugaoo/pages/home_page/data/repositories_impl/home_page_repo_impl.dart';
import 'package:ugaoo/pages/home_page/domain/entities/categories_entities/product_category_entity.dart';
import 'package:ugaoo/pages/home_page/extensions/product_categories_extension.dart';

class FetchProductCategoriesUsecase {
  final HomePageRepoImpl _repo;

  const FetchProductCategoriesUsecase({required HomePageRepoImpl repo})
      : _repo = repo;

  Future<ProductCategoryEntity?> fetchProductCategories() async {
    try {
      final categoryData = await _repo.fetchCategories();
      final ProductCategoryEntity? data = categoryData.toEntity();
      return data;
    } catch (error) {
      rethrow;
    }
  }
}
