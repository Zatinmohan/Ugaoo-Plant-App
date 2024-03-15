// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_category_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomePageCategoryEntity {
  int? get totalCount => throw _privateConstructorUsedError;
  List<CategoryDataEntity>? get categoriesList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomePageCategoryEntityCopyWith<HomePageCategoryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageCategoryEntityCopyWith<$Res> {
  factory $HomePageCategoryEntityCopyWith(HomePageCategoryEntity value,
          $Res Function(HomePageCategoryEntity) then) =
      _$HomePageCategoryEntityCopyWithImpl<$Res, HomePageCategoryEntity>;
  @useResult
  $Res call({int? totalCount, List<CategoryDataEntity>? categoriesList});
}

/// @nodoc
class _$HomePageCategoryEntityCopyWithImpl<$Res,
        $Val extends HomePageCategoryEntity>
    implements $HomePageCategoryEntityCopyWith<$Res> {
  _$HomePageCategoryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = freezed,
    Object? categoriesList = freezed,
  }) {
    return _then(_value.copyWith(
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      categoriesList: freezed == categoriesList
          ? _value.categoriesList
          : categoriesList // ignore: cast_nullable_to_non_nullable
              as List<CategoryDataEntity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomePageCategoryModelImplCopyWith<$Res>
    implements $HomePageCategoryEntityCopyWith<$Res> {
  factory _$$HomePageCategoryModelImplCopyWith(
          _$HomePageCategoryModelImpl value,
          $Res Function(_$HomePageCategoryModelImpl) then) =
      __$$HomePageCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? totalCount, List<CategoryDataEntity>? categoriesList});
}

/// @nodoc
class __$$HomePageCategoryModelImplCopyWithImpl<$Res>
    extends _$HomePageCategoryEntityCopyWithImpl<$Res,
        _$HomePageCategoryModelImpl>
    implements _$$HomePageCategoryModelImplCopyWith<$Res> {
  __$$HomePageCategoryModelImplCopyWithImpl(_$HomePageCategoryModelImpl _value,
      $Res Function(_$HomePageCategoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCount = freezed,
    Object? categoriesList = freezed,
  }) {
    return _then(_$HomePageCategoryModelImpl(
      totalCount: freezed == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int?,
      categoriesList: freezed == categoriesList
          ? _value._categoriesList
          : categoriesList // ignore: cast_nullable_to_non_nullable
              as List<CategoryDataEntity>?,
    ));
  }
}

/// @nodoc

class _$HomePageCategoryModelImpl implements _HomePageCategoryModel {
  const _$HomePageCategoryModelImpl(
      {this.totalCount, final List<CategoryDataEntity>? categoriesList})
      : _categoriesList = categoriesList;

  @override
  final int? totalCount;
  final List<CategoryDataEntity>? _categoriesList;
  @override
  List<CategoryDataEntity>? get categoriesList {
    final value = _categoriesList;
    if (value == null) return null;
    if (_categoriesList is EqualUnmodifiableListView) return _categoriesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HomePageCategoryEntity(totalCount: $totalCount, categoriesList: $categoriesList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomePageCategoryModelImpl &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            const DeepCollectionEquality()
                .equals(other._categoriesList, _categoriesList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalCount,
      const DeepCollectionEquality().hash(_categoriesList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomePageCategoryModelImplCopyWith<_$HomePageCategoryModelImpl>
      get copyWith => __$$HomePageCategoryModelImplCopyWithImpl<
          _$HomePageCategoryModelImpl>(this, _$identity);
}

abstract class _HomePageCategoryModel implements HomePageCategoryEntity {
  const factory _HomePageCategoryModel(
          {final int? totalCount,
          final List<CategoryDataEntity>? categoriesList}) =
      _$HomePageCategoryModelImpl;

  @override
  int? get totalCount;
  @override
  List<CategoryDataEntity>? get categoriesList;
  @override
  @JsonKey(ignore: true)
  _$$HomePageCategoryModelImplCopyWith<_$HomePageCategoryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
