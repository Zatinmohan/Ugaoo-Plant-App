import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ugaoo/pages/home_page/data/model/product_models/product_model.dart';

part 'sub_category_model.freezed.dart';
part 'sub_category_model.g.dart';

@freezed
class SubCategoryModel with _$SubCategoryModel {
  const factory SubCategoryModel({
    List<ProductModel>? products,
    String? subCategoryName,
  }) = _SubCategoryModel;

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryModelFromJson(json);
}
