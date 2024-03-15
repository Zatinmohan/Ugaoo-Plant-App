// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomePageCategoryModelImpl _$$HomePageCategoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HomePageCategoryModelImpl(
      totalCount: json['totalCount'] as int?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HomePageCategoryModelImplToJson(
        _$HomePageCategoryModelImpl instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'categories': instance.categories,
    };
