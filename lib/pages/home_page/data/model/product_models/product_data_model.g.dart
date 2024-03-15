// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductDataModelImpl _$$ProductDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductDataModelImpl(
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => ProductCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductDataModelImplToJson(
        _$ProductDataModelImpl instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };
