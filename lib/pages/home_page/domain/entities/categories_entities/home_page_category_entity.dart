import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ugaoo/pages/home_page/domain/entities/categories_entities/category_entity.dart';

part 'home_page_category_entity.freezed.dart';

@freezed
class HomePageCategoryEntity with _$HomePageCategoryEntity {
  const factory HomePageCategoryEntity({
    int? totalCount,
    List<CategoryDataEntity>? categoriesList,
  }) = _HomePageCategoryModel;
}
