import 'package:ugaoo/pages/home_page/data/model/category_models/category_list_model.dart';

class ProductCategoryModel {
  final List<CategoryListModel>? documents;

  const ProductCategoryModel({
    this.documents,
  });

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) =>
      ProductCategoryModel(
        documents: json["documents"] == null
            ? []
            : List<CategoryListModel>.from(
                // ignore: inference_failure_on_untyped_parameter
                json["documents"]!.map((x) => CategoryListModel.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
        "documents": documents == null
            // ignore: inference_failure_on_collection_literal
            ? []
            : List<dynamic>.from(documents!.map((x) => x.toJson())),
      };
}
