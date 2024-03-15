import 'package:freezed_annotation/freezed_annotation.dart';
part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryDataModel with _$CategoryDataModel {
  const factory CategoryDataModel({
    String? id,
    String? name,
  }) = _CategoryDataModel;

  factory CategoryDataModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataModelFromJson(json);
}
