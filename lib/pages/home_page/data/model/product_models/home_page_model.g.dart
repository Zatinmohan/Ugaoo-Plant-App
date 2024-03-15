// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomePageModelImpl _$$HomePageModelImplFromJson(Map<String, dynamic> json) =>
    _$HomePageModelImpl(
      productData: json['productData'] == null
          ? null
          : ProductDataModel.fromJson(
              json['productData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HomePageModelImplToJson(_$HomePageModelImpl instance) =>
    <String, dynamic>{
      'productData': instance.productData,
    };
