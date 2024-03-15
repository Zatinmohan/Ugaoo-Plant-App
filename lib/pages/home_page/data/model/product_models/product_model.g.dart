// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      itemId: json['itemId'] as String?,
      itemImageUrl: json['itemImageUrl'] as String?,
      itemName: json['itemName'] as String?,
      itemPrice: json['itemPrice'] as int?,
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'itemId': instance.itemId,
      'itemImageUrl': instance.itemImageUrl,
      'itemName': instance.itemName,
      'itemPrice': instance.itemPrice,
    };
