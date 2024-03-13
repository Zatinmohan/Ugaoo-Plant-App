import 'package:ugaoo/pages/home_page/data/model/category_models/categories_data_model.dart';
import 'package:ugaoo/pages/home_page/data/model/category_models/categories_name_model.dart';
import 'package:ugaoo/pages/home_page/data/model/category_models/category_list_model.dart';
import 'package:ugaoo/pages/home_page/data/model/category_models/product_category_model.dart';
import 'package:ugaoo/pages/home_page/domain/entities/categories_entities/category_data_entity.dart';
import 'package:ugaoo/pages/home_page/domain/entities/categories_entities/category_list_entity.dart';
import 'package:ugaoo/pages/home_page/domain/entities/categories_entities/category_names_entity.dart';
import 'package:ugaoo/pages/home_page/domain/entities/categories_entities/product_category_entity.dart';

extension XProductCategoryExtension on ProductCategoryModel {
  ProductCategoryEntity toEntity() => ProductCategoryEntity(
        documents: this.documents?.map((e) => e.toEntity()).toList(),
      );
}

extension XCategoryListEntity on CategoryListModel {
  CategoryListEntity toEntity() => CategoryListEntity(
        name: this.name,
        fields: this.fields?.toEntity(),
      );
}

extension XCategoriesDataModel on CategoriesDataModel {
  CategoryDataEntity toEntity() => CategoryDataEntity(
        categoryName: this.categoryName?.toEntity(),
      );
}

extension XCategoryNameModel on CategoryNamesModel {
  CategoryNameEntity toEntity() => CategoryNameEntity(
        stringValue: this.stringValue,
      );
}
