import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ugaoo/pages/home_page/domain/entities/product_entities/product_category_entity.dart';

part 'product_data_entity.freezed.dart';

@freezed
class ProductDataEntity with _$ProductDataEntity {
  const factory ProductDataEntity({
    List<ProductCategoryEntity>? categories,
  }) = _ProductDataEntity;
}
