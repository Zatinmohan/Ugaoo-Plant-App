import 'package:freezed_annotation/freezed_annotation.dart';
part 'category_entity.freezed.dart';

@freezed
class CategoryDataEntity with _$CategoryDataEntity {
  const factory CategoryDataEntity({
    String? id,
    String? name,
  }) = _CategoryDataEntity;
}
