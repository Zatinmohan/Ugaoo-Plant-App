import 'package:ugaoo/private_keys/private_keys.dart';
import 'package:ugaoo/pages/home_page/data/model/category_models/product_category_model.dart';
import 'package:ugaoo/services/api/api_constants.dart';
import 'package:ugaoo/services/api/api_provider.dart';

class HomePageRepoImpl {
  final ApiProvider _apiProvider;

  const HomePageRepoImpl({required ApiProvider provider})
      : _apiProvider = provider;

  Future<ProductCategoryModel> fetchCategories() async {
    try {
      Map<String, dynamic> params = {
        "key": PROJECT_KEY,
      };
      Map<String, dynamic> json = await _apiProvider.getRequest(
        endPoint: ApiConstants.GET_PRODUCT_CATEGORIES,
        useBaseUrl: true,
        params: params,
      );

      final data = ProductCategoryModel.fromJson(json);
      return data;
    } catch (error) {
      rethrow;
    }
  }
}
