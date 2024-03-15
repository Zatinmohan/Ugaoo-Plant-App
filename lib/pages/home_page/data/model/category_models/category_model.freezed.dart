// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CategoryDataModel _$CategoryDataModelFromJson(Map<String, dynamic> json) {
  return _CategoryDataModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryDataModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryDataModelCopyWith<CategoryDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDataModelCopyWith<$Res> {
  factory $CategoryDataModelCopyWith(
          CategoryDataModel value, $Res Function(CategoryDataModel) then) =
      _$CategoryDataModelCopyWithImpl<$Res, CategoryDataModel>;
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class _$CategoryDataModelCopyWithImpl<$Res, $Val extends CategoryDataModel>
    implements $CategoryDataModelCopyWith<$Res> {
  _$CategoryDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryDataModelImplCopyWith<$Res>
    implements $CategoryDataModelCopyWith<$Res> {
  factory _$$CategoryDataModelImplCopyWith(_$CategoryDataModelImpl value,
          $Res Function(_$CategoryDataModelImpl) then) =
      __$$CategoryDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class __$$CategoryDataModelImplCopyWithImpl<$Res>
    extends _$CategoryDataModelCopyWithImpl<$Res, _$CategoryDataModelImpl>
    implements _$$CategoryDataModelImplCopyWith<$Res> {
  __$$CategoryDataModelImplCopyWithImpl(_$CategoryDataModelImpl _value,
      $Res Function(_$CategoryDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$CategoryDataModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryDataModelImpl implements _CategoryDataModel {
  const _$CategoryDataModelImpl({this.id, this.name});

  factory _$CategoryDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryDataModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'CategoryDataModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryDataModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryDataModelImplCopyWith<_$CategoryDataModelImpl> get copyWith =>
      __$$CategoryDataModelImplCopyWithImpl<_$CategoryDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryDataModelImplToJson(
      this,
    );
  }
}

abstract class _CategoryDataModel implements CategoryDataModel {
  const factory _CategoryDataModel({final String? id, final String? name}) =
      _$CategoryDataModelImpl;

  factory _CategoryDataModel.fromJson(Map<String, dynamic> json) =
      _$CategoryDataModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$CategoryDataModelImplCopyWith<_$CategoryDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
