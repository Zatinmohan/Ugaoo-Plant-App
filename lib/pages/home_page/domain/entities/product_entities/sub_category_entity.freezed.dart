// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_category_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubCategoryEntity {
  List<ProductEntity>? get products => throw _privateConstructorUsedError;
  String? get subCategoryName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubCategoryEntityCopyWith<SubCategoryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubCategoryEntityCopyWith<$Res> {
  factory $SubCategoryEntityCopyWith(
          SubCategoryEntity value, $Res Function(SubCategoryEntity) then) =
      _$SubCategoryEntityCopyWithImpl<$Res, SubCategoryEntity>;
  @useResult
  $Res call({List<ProductEntity>? products, String? subCategoryName});
}

/// @nodoc
class _$SubCategoryEntityCopyWithImpl<$Res, $Val extends SubCategoryEntity>
    implements $SubCategoryEntityCopyWith<$Res> {
  _$SubCategoryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = freezed,
    Object? subCategoryName = freezed,
  }) {
    return _then(_value.copyWith(
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>?,
      subCategoryName: freezed == subCategoryName
          ? _value.subCategoryName
          : subCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubCategoryEntityImplCopyWith<$Res>
    implements $SubCategoryEntityCopyWith<$Res> {
  factory _$$SubCategoryEntityImplCopyWith(_$SubCategoryEntityImpl value,
          $Res Function(_$SubCategoryEntityImpl) then) =
      __$$SubCategoryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProductEntity>? products, String? subCategoryName});
}

/// @nodoc
class __$$SubCategoryEntityImplCopyWithImpl<$Res>
    extends _$SubCategoryEntityCopyWithImpl<$Res, _$SubCategoryEntityImpl>
    implements _$$SubCategoryEntityImplCopyWith<$Res> {
  __$$SubCategoryEntityImplCopyWithImpl(_$SubCategoryEntityImpl _value,
      $Res Function(_$SubCategoryEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = freezed,
    Object? subCategoryName = freezed,
  }) {
    return _then(_$SubCategoryEntityImpl(
      products: freezed == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>?,
      subCategoryName: freezed == subCategoryName
          ? _value.subCategoryName
          : subCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SubCategoryEntityImpl implements _SubCategoryEntity {
  const _$SubCategoryEntityImpl(
      {final List<ProductEntity>? products, this.subCategoryName})
      : _products = products;

  final List<ProductEntity>? _products;
  @override
  List<ProductEntity>? get products {
    final value = _products;
    if (value == null) return null;
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? subCategoryName;

  @override
  String toString() {
    return 'SubCategoryEntity(products: $products, subCategoryName: $subCategoryName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubCategoryEntityImpl &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.subCategoryName, subCategoryName) ||
                other.subCategoryName == subCategoryName));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_products), subCategoryName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubCategoryEntityImplCopyWith<_$SubCategoryEntityImpl> get copyWith =>
      __$$SubCategoryEntityImplCopyWithImpl<_$SubCategoryEntityImpl>(
          this, _$identity);
}

abstract class _SubCategoryEntity implements SubCategoryEntity {
  const factory _SubCategoryEntity(
      {final List<ProductEntity>? products,
      final String? subCategoryName}) = _$SubCategoryEntityImpl;

  @override
  List<ProductEntity>? get products;
  @override
  String? get subCategoryName;
  @override
  @JsonKey(ignore: true)
  _$$SubCategoryEntityImplCopyWith<_$SubCategoryEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
