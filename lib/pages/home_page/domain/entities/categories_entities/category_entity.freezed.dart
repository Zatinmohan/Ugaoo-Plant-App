// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoryDataEntity {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryDataEntityCopyWith<CategoryDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDataEntityCopyWith<$Res> {
  factory $CategoryDataEntityCopyWith(
          CategoryDataEntity value, $Res Function(CategoryDataEntity) then) =
      _$CategoryDataEntityCopyWithImpl<$Res, CategoryDataEntity>;
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class _$CategoryDataEntityCopyWithImpl<$Res, $Val extends CategoryDataEntity>
    implements $CategoryDataEntityCopyWith<$Res> {
  _$CategoryDataEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$CategoryDataEntityImplCopyWith<$Res>
    implements $CategoryDataEntityCopyWith<$Res> {
  factory _$$CategoryDataEntityImplCopyWith(_$CategoryDataEntityImpl value,
          $Res Function(_$CategoryDataEntityImpl) then) =
      __$$CategoryDataEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class __$$CategoryDataEntityImplCopyWithImpl<$Res>
    extends _$CategoryDataEntityCopyWithImpl<$Res, _$CategoryDataEntityImpl>
    implements _$$CategoryDataEntityImplCopyWith<$Res> {
  __$$CategoryDataEntityImplCopyWithImpl(_$CategoryDataEntityImpl _value,
      $Res Function(_$CategoryDataEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$CategoryDataEntityImpl(
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

class _$CategoryDataEntityImpl implements _CategoryDataEntity {
  const _$CategoryDataEntityImpl({this.id, this.name});

  @override
  final String? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'CategoryDataEntity(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryDataEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryDataEntityImplCopyWith<_$CategoryDataEntityImpl> get copyWith =>
      __$$CategoryDataEntityImplCopyWithImpl<_$CategoryDataEntityImpl>(
          this, _$identity);
}

abstract class _CategoryDataEntity implements CategoryDataEntity {
  const factory _CategoryDataEntity({final String? id, final String? name}) =
      _$CategoryDataEntityImpl;

  @override
  String? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$CategoryDataEntityImplCopyWith<_$CategoryDataEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
