import 'package:ugaoo/pages/home_page/data/model/category_models/categories_data_model.dart';

class CategoryListModel {
  final String? name;
  final CategoriesDataModel? fields;
  final String? createTime;
  final String? updateTime;

  const CategoryListModel({
    this.name,
    this.fields,
    this.createTime,
    this.updateTime,
  });

  factory CategoryListModel.fromJson(Map<String, dynamic> json) =>
      CategoryListModel(
        name: json["name"],
        fields: json["fields"] == null
            ? null
            : CategoriesDataModel.fromJson(json["fields"]),
        createTime: json["createTime"],
        updateTime: json["updateTime"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "fields": fields?.toJson(),
        "createTime": createTime,
        "updateTime": updateTime,
      };
}
