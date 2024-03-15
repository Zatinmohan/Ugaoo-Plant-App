// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_data_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductDataEntity {
  List<ProductCategoryEntity>? get categories =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductDataEntityCopyWith<ProductDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDataEntityCopyWith<$Res> {
  factory $ProductDataEntityCopyWith(
          ProductDataEntity value, $Res Function(ProductDataEntity) then) =
      _$ProductDataEntityCopyWithImpl<$Res, ProductDataEntity>;
  @useResult
  $Res call({List<ProductCategoryEntity>? categories});
}

/// @nodoc
class _$ProductDataEntityCopyWithImpl<$Res, $Val extends ProductDataEntity>
    implements $ProductDataEntityCopyWith<$Res> {
  _$ProductDataEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(_value.copyWith(
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategoryEntity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductDataEntityImplCopyWith<$Res>
    implements $ProductDataEntityCopyWith<$Res> {
  factory _$$ProductDataEntityImplCopyWith(_$ProductDataEntityImpl value,
          $Res Function(_$ProductDataEntityImpl) then) =
      __$$ProductDataEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProductCategoryEntity>? categories});
}

/// @nodoc
class __$$ProductDataEntityImplCopyWithImpl<$Res>
    extends _$ProductDataEntityCopyWithImpl<$Res, _$ProductDataEntityImpl>
    implements _$$ProductDataEntityImplCopyWith<$Res> {
  __$$ProductDataEntityImplCopyWithImpl(_$ProductDataEntityImpl _value,
      $Res Function(_$ProductDataEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(_$ProductDataEntityImpl(
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategoryEntity>?,
    ));
  }
}

/// @nodoc

class _$ProductDataEntityImpl implements _ProductDataEntity {
  const _$ProductDataEntityImpl({final List<ProductCategoryEntity>? categories})
      : _categories = categories;

  final List<ProductCategoryEntity>? _categories;
  @override
  List<ProductCategoryEntity>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProductDataEntity(categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDataEntityImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDataEntityImplCopyWith<_$ProductDataEntityImpl> get copyWith =>
      __$$ProductDataEntityImplCopyWithImpl<_$ProductDataEntityImpl>(
          this, _$identity);
}

abstract class _ProductDataEntity implements ProductDataEntity {
  const factory _ProductDataEntity(
          {final List<ProductCategoryEntity>? categories}) =
      _$ProductDataEntityImpl;

  @override
  List<ProductCategoryEntity>? get categories;
  @override
  @JsonKey(ignore: true)
  _$$ProductDataEntityImplCopyWith<_$ProductDataEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
