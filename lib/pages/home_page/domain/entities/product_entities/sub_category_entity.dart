import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ugaoo/pages/home_page/domain/entities/product_entities/product_entity.dart';

part 'sub_category_entity.freezed.dart';

@freezed
class SubCategoryEntity with _$SubCategoryEntity {
  const factory SubCategoryEntity({
    List<ProductEntity>? products,
    String? subCategoryName,
  }) = _SubCategoryEntity;
}
