
import 'package:ugaoo/pages/home_page/data/model/category_models/home_page_category_model.dart';
import 'package:ugaoo/pages/home_page/data/model/product_models/home_page_model.dart';
import 'package:ugaoo/services/api/api_constants.dart';
import 'package:ugaoo/services/api/api_provider.dart';

class HomePageRepoImpl {
  final ApiProvider _apiProvider;

  const HomePageRepoImpl({required ApiProvider provider})
      : _apiProvider = provider;

  Future<HomePageCategoryModel> fetchCategories() async {
    try {
      Map<String, dynamic> json = await _apiProvider.getRequest(
        endPoint: ApiConstants.GET_PRODUCT_CATEGORIES,
        useBaseUrl: true,
      );

      final HomePageCategoryModel data = HomePageCategoryModel.fromJson(json);

      return data;
    } catch (error) {
      rethrow;
    }
  }

  Future<HomePageModel> fetchProductData() async {
    try {
      Map<String, dynamic> json = await _apiProvider.getRequest(
        endPoint: ApiConstants.GET_PRODUCTS,
        useBaseUrl: true,
      );
      final HomePageModel data = HomePageModel.fromJson(json);
      return data;
    } catch (error) {
      rethrow;
    }
  }
}
