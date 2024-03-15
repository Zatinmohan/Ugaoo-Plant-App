import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_entity.freezed.dart';

@freezed
class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    String? itemId,
    String? itemImageUrl,
    String? itemName,
    int? itemPrice,
  }) = _ProductEntity;
}
