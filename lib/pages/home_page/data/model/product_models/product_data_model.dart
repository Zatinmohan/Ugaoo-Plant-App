import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ugaoo/pages/home_page/data/model/product_models/product_category_model.dart';

part 'product_data_model.freezed.dart';
part 'product_data_model.g.dart';

@freezed
class ProductDataModel with _$ProductDataModel {
  const factory ProductDataModel({
    List<ProductCategoryModel>? categories,
  }) = _ProductDataModel;

  factory ProductDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDataModelFromJson(json);
}
