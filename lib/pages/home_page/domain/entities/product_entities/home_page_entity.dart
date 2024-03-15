import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ugaoo/pages/home_page/domain/entities/product_entities/product_data_entity.dart';

part 'home_page_entity.freezed.dart';

@freezed
class HomePageEntity with _$HomePageEntity {
  const factory HomePageEntity({
    ProductDataEntity? productData,
  }) = _HomePageEntity;
}
