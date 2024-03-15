// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductCategoryModelImpl _$$ProductCategoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductCategoryModelImpl(
      categoryId: json['categoryId'] as String?,
      subCategories: (json['subCategories'] as List<dynamic>?)
          ?.map((e) => SubCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductCategoryModelImplToJson(
        _$ProductCategoryModelImpl instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'subCategories': instance.subCategories,
    };
