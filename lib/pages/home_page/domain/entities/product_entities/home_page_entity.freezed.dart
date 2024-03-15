// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomePageEntity {
  ProductDataEntity? get productData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomePageEntityCopyWith<HomePageEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageEntityCopyWith<$Res> {
  factory $HomePageEntityCopyWith(
          HomePageEntity value, $Res Function(HomePageEntity) then) =
      _$HomePageEntityCopyWithImpl<$Res, HomePageEntity>;
  @useResult
  $Res call({ProductDataEntity? productData});

  $ProductDataEntityCopyWith<$Res>? get productData;
}

/// @nodoc
class _$HomePageEntityCopyWithImpl<$Res, $Val extends HomePageEntity>
    implements $HomePageEntityCopyWith<$Res> {
  _$HomePageEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productData = freezed,
  }) {
    return _then(_value.copyWith(
      productData: freezed == productData
          ? _value.productData
          : productData // ignore: cast_nullable_to_non_nullable
              as ProductDataEntity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductDataEntityCopyWith<$Res>? get productData {
    if (_value.productData == null) {
      return null;
    }

    return $ProductDataEntityCopyWith<$Res>(_value.productData!, (value) {
      return _then(_value.copyWith(productData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomePageEntityImplCopyWith<$Res>
    implements $HomePageEntityCopyWith<$Res> {
  factory _$$HomePageEntityImplCopyWith(_$HomePageEntityImpl value,
          $Res Function(_$HomePageEntityImpl) then) =
      __$$HomePageEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProductDataEntity? productData});

  @override
  $ProductDataEntityCopyWith<$Res>? get productData;
}

/// @nodoc
class __$$HomePageEntityImplCopyWithImpl<$Res>
    extends _$HomePageEntityCopyWithImpl<$Res, _$HomePageEntityImpl>
    implements _$$HomePageEntityImplCopyWith<$Res> {
  __$$HomePageEntityImplCopyWithImpl(
      _$HomePageEntityImpl _value, $Res Function(_$HomePageEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productData = freezed,
  }) {
    return _then(_$HomePageEntityImpl(
      productData: freezed == productData
          ? _value.productData
          : productData // ignore: cast_nullable_to_non_nullable
              as ProductDataEntity?,
    ));
  }
}

/// @nodoc

class _$HomePageEntityImpl implements _HomePageEntity {
  const _$HomePageEntityImpl({this.productData});

  @override
  final ProductDataEntity? productData;

  @override
  String toString() {
    return 'HomePageEntity(productData: $productData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomePageEntityImpl &&
            (identical(other.productData, productData) ||
                other.productData == productData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomePageEntityImplCopyWith<_$HomePageEntityImpl> get copyWith =>
      __$$HomePageEntityImplCopyWithImpl<_$HomePageEntityImpl>(
          this, _$identity);
}

abstract class _HomePageEntity implements HomePageEntity {
  const factory _HomePageEntity({final ProductDataEntity? productData}) =
      _$HomePageEntityImpl;

  @override
  ProductDataEntity? get productData;
  @override
  @JsonKey(ignore: true)
  _$$HomePageEntityImplCopyWith<_$HomePageEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
