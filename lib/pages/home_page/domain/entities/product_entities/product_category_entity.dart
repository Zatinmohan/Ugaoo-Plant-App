import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ugaoo/pages/home_page/domain/entities/product_entities/sub_category_entity.dart';

part 'product_category_entity.freezed.dart';

@freezed
class ProductCategoryEntity with _$ProductCategoryEntity {
  const factory ProductCategoryEntity({
    String? categoryId,
    List<SubCategoryEntity>? subCategories,
  }) = _ProductCategoryEntity;
}
