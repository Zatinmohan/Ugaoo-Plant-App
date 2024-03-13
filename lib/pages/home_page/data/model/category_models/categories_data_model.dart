import 'package:ugaoo/pages/home_page/data/model/category_models/categories_name_model.dart';

class CategoriesDataModel {
  final CategoryNamesModel? categoryName;

  const CategoriesDataModel({
    this.categoryName,
  });

  factory CategoriesDataModel.fromJson(Map<String, dynamic> json) =>
      CategoriesDataModel(
        categoryName: json["categoryName"] == null
            ? null
            : CategoryNamesModel.fromJson(json["categoryName"]),
      );

  Map<String, dynamic> toJson() => {
        "categoryName": categoryName?.toJson(),
      };
}
