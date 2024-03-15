import 'package:ugaoo/pages/home_page/data/model/category_models/category_model.dart';
import 'package:ugaoo/pages/home_page/data/model/category_models/home_page_category_model.dart';
import 'package:ugaoo/pages/home_page/domain/entities/categories_entities/category_entity.dart';
import 'package:ugaoo/pages/home_page/domain/entities/categories_entities/home_page_category_entity.dart';

extension XHomePageCategoryModel on HomePageCategoryModel {
  HomePageCategoryEntity toEntity() => HomePageCategoryEntity(
        totalCount: this.totalCount,
        categoriesList: this.categories?.map((e) => e.toEntity()).toList(),
      );
}

extension XCategoryModel on CategoryDataModel {
  CategoryDataEntity toEntity() => CategoryDataEntity(
        id: this.id,
        name: this.name,
      );
}
