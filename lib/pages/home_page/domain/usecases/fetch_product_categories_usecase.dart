import 'package:ugaoo/pages/home_page/data/model/category_models/home_page_category_model.dart';
import 'package:ugaoo/pages/home_page/data/repositories_impl/home_page_repo_impl.dart';
import 'package:ugaoo/pages/home_page/domain/entities/categories_entities/home_page_category_entity.dart';
import 'package:ugaoo/pages/home_page/extensions/categories_extension.dart';

class FetchProductCategoriesUsecase {
  final HomePageRepoImpl _repo;

  const FetchProductCategoriesUsecase({required HomePageRepoImpl repo})
      : _repo = repo;

  Future<HomePageCategoryEntity?> fetchProductCategories() async {
    try {
      final HomePageCategoryModel categoryData = await _repo.fetchCategories();
      final HomePageCategoryEntity? data = categoryData.toEntity();
      return data;
    } catch (error) {
      rethrow;
    }
  }
}
