import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ugaoo/pages/home_page/data/model/product_models/product_data_model.dart';

part 'home_page_model.freezed.dart';
part 'home_page_model.g.dart';

@freezed
class HomePageModel with _$HomePageModel {
  const factory HomePageModel({
    ProductDataModel? productData,
  }) = _HomePageModel;

  factory HomePageModel.fromJson(Map<String, dynamic> json) =>
      _$HomePageModelFromJson(json);
}
