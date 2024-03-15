import 'package:ugaoo/pages/home_page/data/model/product_models/home_page_model.dart';
import 'package:ugaoo/pages/home_page/data/repositories_impl/home_page_repo_impl.dart';
import 'package:ugaoo/pages/home_page/domain/entities/product_entities/product_data_entity.dart';
import 'package:ugaoo/pages/home_page/extensions/product_data_extension.dart';

class FetchProductDataUsecase {
  final HomePageRepoImpl _repo;

  const FetchProductDataUsecase({required HomePageRepoImpl repo})
      : _repo = repo;

  Future<ProductDataEntity?> fetchProducts() async {
    try {
      final HomePageModel result = await _repo.fetchProductData();
      final ProductDataEntity? data = result.productData?.toEntity();
      return data;
    } catch (error) {
      rethrow;
    }
  }
}
