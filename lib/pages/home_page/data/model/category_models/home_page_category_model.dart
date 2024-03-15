import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ugaoo/pages/home_page/data/model/category_models/category_model.dart';

part 'home_page_category_model.freezed.dart';
part 'home_page_category_model.g.dart';

@freezed
class HomePageCategoryModel with _$HomePageCategoryModel {
  const factory HomePageCategoryModel({
    int? totalCount,
    List<CategoryDataModel>? categories,
  }) = _HomePageCategoryModel;

  factory HomePageCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$HomePageCategoryModelFromJson(json);
}
