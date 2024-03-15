// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductCategoryModel _$ProductCategoryModelFromJson(Map<String, dynamic> json) {
  return _ProductCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$ProductCategoryModel {
  String? get categoryId => throw _privateConstructorUsedError;
  List<SubCategoryModel>? get subCategories =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCategoryModelCopyWith<ProductCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCategoryModelCopyWith<$Res> {
  factory $ProductCategoryModelCopyWith(ProductCategoryModel value,
          $Res Function(ProductCategoryModel) then) =
      _$ProductCategoryModelCopyWithImpl<$Res, ProductCategoryModel>;
  @useResult
  $Res call({String? categoryId, List<SubCategoryModel>? subCategories});
}

/// @nodoc
class _$ProductCategoryModelCopyWithImpl<$Res,
        $Val extends ProductCategoryModel>
    implements $ProductCategoryModelCopyWith<$Res> {
  _$ProductCategoryModelCopyWithImpl(this._value, this._then);

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
              as List<SubCategoryModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductCategoryModelImplCopyWith<$Res>
    implements $ProductCategoryModelCopyWith<$Res> {
  factory _$$ProductCategoryModelImplCopyWith(_$ProductCategoryModelImpl value,
          $Res Function(_$ProductCategoryModelImpl) then) =
      __$$ProductCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? categoryId, List<SubCategoryModel>? subCategories});
}

/// @nodoc
class __$$ProductCategoryModelImplCopyWithImpl<$Res>
    extends _$ProductCategoryModelCopyWithImpl<$Res, _$ProductCategoryModelImpl>
    implements _$$ProductCategoryModelImplCopyWith<$Res> {
  __$$ProductCategoryModelImplCopyWithImpl(_$ProductCategoryModelImpl _value,
      $Res Function(_$ProductCategoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? subCategories = freezed,
  }) {
    return _then(_$ProductCategoryModelImpl(
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategories: freezed == subCategories
          ? _value._subCategories
          : subCategories // ignore: cast_nullable_to_non_nullable
              as List<SubCategoryModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductCategoryModelImpl implements _ProductCategoryModel {
  const _$ProductCategoryModelImpl(
      {this.categoryId, final List<SubCategoryModel>? subCategories})
      : _subCategories = subCategories;

  factory _$ProductCategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductCategoryModelImplFromJson(json);

  @override
  final String? categoryId;
  final List<SubCategoryModel>? _subCategories;
  @override
  List<SubCategoryModel>? get subCategories {
    final value = _subCategories;
    if (value == null) return null;
    if (_subCategories is EqualUnmodifiableListView) return _subCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProductCategoryModel(categoryId: $categoryId, subCategories: $subCategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductCategoryModelImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            const DeepCollectionEquality()
                .equals(other._subCategories, _subCategories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, categoryId,
      const DeepCollectionEquality().hash(_subCategories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductCategoryModelImplCopyWith<_$ProductCategoryModelImpl>
      get copyWith =>
          __$$ProductCategoryModelImplCopyWithImpl<_$ProductCategoryModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductCategoryModelImplToJson(
      this,
    );
  }
}

abstract class _ProductCategoryModel implements ProductCategoryModel {
  const factory _ProductCategoryModel(
          {final String? categoryId,
          final List<SubCategoryModel>? subCategories}) =
      _$ProductCategoryModelImpl;

  factory _ProductCategoryModel.fromJson(Map<String, dynamic> json) =
      _$ProductCategoryModelImpl.fromJson;

  @override
  String? get categoryId;
  @override
  List<SubCategoryModel>? get subCategories;
  @override
  @JsonKey(ignore: true)
  _$$ProductCategoryModelImplCopyWith<_$ProductCategoryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
