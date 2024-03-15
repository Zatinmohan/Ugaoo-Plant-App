import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ugaoo/pages/home_page/data/model/product_models/sub_category_model.dart';

part 'product_category_model.freezed.dart';
part 'product_category_model.g.dart';

@freezed
class ProductCategoryModel with _$ProductCategoryModel {
  const factory ProductCategoryModel({
    String? categoryId,
    List<SubCategoryModel>? subCategories,
  }) = _ProductCategoryModel;

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryModelFromJson(json);
}
