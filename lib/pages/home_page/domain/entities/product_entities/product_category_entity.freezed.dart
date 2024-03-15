// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_category_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductCategoryEntity {
  String? get categoryId => throw _privateConstructorUsedError;
  List<SubCategoryEntity>? get subCategories =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductCategoryEntityCopyWith<ProductCategoryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCategoryEntityCopyWith<$Res> {
  factory $ProductCategoryEntityCopyWith(ProductCategoryEntity value,
          $Res Function(ProductCategoryEntity) then) =
      _$ProductCategoryEntityCopyWithImpl<$Res, ProductCategoryEntity>;
  @useResult
  $Res call({String? categoryId, List<SubCategoryEntity>? subCategories});
}

/// @nodoc
class _$ProductCategoryEntityCopyWithImpl<$Res,
        $Val extends ProductCategoryEntity>
    implements $ProductCategoryEntityCopyWith<$Res> {
  _$ProductCategoryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? subCategories = freezed,
  }) {
    return _then(_value.copyWith(
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategories: freezed == subCategories
          ? _value.subCategories
          : subCategories // ignore: cast_nullable_to_non_nullable
              as List<SubCategoryEntity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductCategoryEntityImplCopyWith<$Res>
    implements $ProductCategoryEntityCopyWith<$Res> {
  factory _$$ProductCategoryEntityImplCopyWith(
          _$ProductCategoryEntityImpl value,
          $Res Function(_$ProductCategoryEntityImpl) then) =
      __$$ProductCategoryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? categoryId, List<SubCategoryEntity>? subCategories});
}

/// @nodoc
class __$$ProductCategoryEntityImplCopyWithImpl<$Res>
    extends _$ProductCategoryEntityCopyWithImpl<$Res,
        _$ProductCategoryEntityImpl>
    implements _$$ProductCategoryEntityImplCopyWith<$Res> {
  __$$ProductCategoryEntityImplCopyWithImpl(_$ProductCategoryEntityImpl _value,
      $Res Function(_$ProductCategoryEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? subCategories = freezed,
  }) {
    return _then(_$ProductCategoryEntityImpl(
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategories: freezed == subCategories
          ? _value._subCategories
          : subCategories // ignore: cast_nullable_to_non_nullable
              as List<SubCategoryEntity>?,
    ));
  }
}

/// @nodoc

class _$ProductCategoryEntityImpl implements _ProductCategoryEntity {
  const _$ProductCategoryEntityImpl(
      {this.categoryId, final List<SubCategoryEntity>? subCategories})
      : _subCategories = subCategories;

  @override
  final String? categoryId;
  final List<SubCategoryEntity>? _subCategories;
  @override
  List<SubCategoryEntity>? get subCategories {
    final value = _subCategories;
    if (value == null) return null;
    if (_subCategories is EqualUnmodifiableListView) return _subCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProductCategoryEntity(categoryId: $categoryId, subCategories: $subCategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductCategoryEntityImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            const DeepCollectionEquality()
                .equals(other._subCategories, _subCategories));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId,
      const DeepCollectionEquality().hash(_subCategories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductCategoryEntityImplCopyWith<_$ProductCategoryEntityImpl>
      get copyWith => __$$ProductCategoryEntityImplCopyWithImpl<
          _$ProductCategoryEntityImpl>(this, _$identity);
}

abstract class _ProductCategoryEntity implements ProductCategoryEntity {
  const factory _ProductCategoryEntity(
          {final String? categoryId,
          final List<SubCategoryEntity>? subCategories}) =
      _$ProductCategoryEntityImpl;

  @override
  String? get categoryId;
  @override
  List<SubCategoryEntity>? get subCategories;
  @override
  @JsonKey(ignore: true)
  _$$ProductCategoryEntityImplCopyWith<_$ProductCategoryEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
