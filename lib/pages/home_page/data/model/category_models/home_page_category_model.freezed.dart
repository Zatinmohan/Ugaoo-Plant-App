// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomePageCategoryModel _$HomePageCategoryModelFromJson(
    Map<String, dynamic> json) {
  return _HomePageCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$HomePageCategoryModel {
  int? get totalCount => throw _privateConstructorUsedError;
  List<CategoryDataModel>? get categories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomePageCategoryModelCopyWith<HomePageCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageCategoryModelCopyWith<$Res> {
  factory $HomePageCategoryModelCopyWith(HomePageCategoryModel value,
          $Res Function(HomePageCategoryModel) then) =
      _$HomePageCategoryModelCopyWithImpl<$Res, HomePageCategoryModel>;
  @useResult
  $Res call({int? totalCount, List<CategoryDataModel>? categories});
}

/// @nodoc
class _$HomePageCategoryModelCopyWithImpl<$Res,
        $Val extends HomePageCategoryModel>
    implements $HomePageCategoryModelCopyWith<$Res> {
  _$HomePageCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = freezed,
    Object? categories = freezed,
  }) {
    return _then(_value.copyWith(
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDataModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomePageCategoryModelImplCopyWith<$Res>
    implements $HomePageCategoryModelCopyWith<$Res> {
  factory _$$HomePageCategoryModelImplCopyWith(
          _$HomePageCategoryModelImpl value,
          $Res Function(_$HomePageCategoryModelImpl) then) =
      __$$HomePageCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? totalCount, List<CategoryDataModel>? categories});
}

/// @nodoc
class __$$HomePageCategoryModelImplCopyWithImpl<$Res>
    extends _$HomePageCategoryModelCopyWithImpl<$Res,
        _$HomePageCategoryModelImpl>
    implements _$$HomePageCategoryModelImplCopyWith<$Res> {
  __$$HomePageCategoryModelImplCopyWithImpl(_$HomePageCategoryModelImpl _value,
      $Res Function(_$HomePageCategoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = freezed,
    Object? categories = freezed,
  }) {
    return _then(_$HomePageCategoryModelImpl(
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryDataModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomePageCategoryModelImpl implements _HomePageCategoryModel {
  const _$HomePageCategoryModelImpl(
      {this.totalCount, final List<CategoryDataModel>? categories})
      : _categories = categories;

  factory _$HomePageCategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomePageCategoryModelImplFromJson(json);

  @override
  final int? totalCount;
  final List<CategoryDataModel>? _categories;
  @override
  List<CategoryDataModel>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HomePageCategoryModel(totalCount: $totalCount, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomePageCategoryModelImpl &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalCount,
      const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomePageCategoryModelImplCopyWith<_$HomePageCategoryModelImpl>
      get copyWith => __$$HomePageCategoryModelImplCopyWithImpl<
          _$HomePageCategoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomePageCategoryModelImplToJson(
      this,
    );
  }
}

abstract class _HomePageCategoryModel implements HomePageCategoryModel {
  const factory _HomePageCategoryModel(
      {final int? totalCount,
      final List<CategoryDataModel>? categories}) = _$HomePageCategoryModelImpl;

  factory _HomePageCategoryModel.fromJson(Map<String, dynamic> json) =
      _$HomePageCategoryModelImpl.fromJson;

  @override
  int? get totalCount;
  @override
  List<CategoryDataModel>? get categories;
  @override
  @JsonKey(ignore: true)
  _$$HomePageCategoryModelImplCopyWith<_$HomePageCategoryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
