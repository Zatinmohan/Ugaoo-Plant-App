// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductDataModel _$ProductDataModelFromJson(Map<String, dynamic> json) {
  return _ProductDataModel.fromJson(json);
}

/// @nodoc
mixin _$ProductDataModel {
  List<ProductCategoryModel>? get categories =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductDataModelCopyWith<ProductDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDataModelCopyWith<$Res> {
  factory $ProductDataModelCopyWith(
          ProductDataModel value, $Res Function(ProductDataModel) then) =
      _$ProductDataModelCopyWithImpl<$Res, ProductDataModel>;
  @useResult
  $Res call({List<ProductCategoryModel>? categories});
}

/// @nodoc
class _$ProductDataModelCopyWithImpl<$Res, $Val extends ProductDataModel>
    implements $ProductDataModelCopyWith<$Res> {
  _$ProductDataModelCopyWithImpl(this._value, this._then);

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
              as List<ProductCategoryModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductDataModelImplCopyWith<$Res>
    implements $ProductDataModelCopyWith<$Res> {
  factory _$$ProductDataModelImplCopyWith(_$ProductDataModelImpl value,
          $Res Function(_$ProductDataModelImpl) then) =
      __$$ProductDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProductCategoryModel>? categories});
}

/// @nodoc
class __$$ProductDataModelImplCopyWithImpl<$Res>
    extends _$ProductDataModelCopyWithImpl<$Res, _$ProductDataModelImpl>
    implements _$$ProductDataModelImplCopyWith<$Res> {
  __$$ProductDataModelImplCopyWithImpl(_$ProductDataModelImpl _value,
      $Res Function(_$ProductDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(_$ProductDataModelImpl(
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategoryModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductDataModelImpl implements _ProductDataModel {
  const _$ProductDataModelImpl({final List<ProductCategoryModel>? categories})
      : _categories = categories;

  factory _$ProductDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductDataModelImplFromJson(json);

  final List<ProductCategoryModel>? _categories;
  @override
  List<ProductCategoryModel>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProductDataModel(categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDataModelImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDataModelImplCopyWith<_$ProductDataModelImpl> get copyWith =>
      __$$ProductDataModelImplCopyWithImpl<_$ProductDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductDataModelImplToJson(
      this,
    );
  }
}

abstract class _ProductDataModel implements ProductDataModel {
  const factory _ProductDataModel(
      {final List<ProductCategoryModel>? categories}) = _$ProductDataModelImpl;

  factory _ProductDataModel.fromJson(Map<String, dynamic> json) =
      _$ProductDataModelImpl.fromJson;

  @override
  List<ProductCategoryModel>? get categories;
  @override
  @JsonKey(ignore: true)
  _$$ProductDataModelImplCopyWith<_$ProductDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
