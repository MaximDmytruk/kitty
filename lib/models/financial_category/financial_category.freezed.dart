// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'financial_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FinancialCategory _$FinancialCategoryFromJson(Map<String, dynamic> json) {
  return _FinancialCategory.fromJson(json);
}

/// @nodoc
mixin _$FinancialCategory {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get colorValue => throw _privateConstructorUsedError;
  String get iconPath => throw _privateConstructorUsedError;
  int? get position => throw _privateConstructorUsedError;

  /// Serializes this FinancialCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FinancialCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FinancialCategoryCopyWith<FinancialCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinancialCategoryCopyWith<$Res> {
  factory $FinancialCategoryCopyWith(
          FinancialCategory value, $Res Function(FinancialCategory) then) =
      _$FinancialCategoryCopyWithImpl<$Res, FinancialCategory>;
  @useResult
  $Res call(
      {int? id,
      String name,
      @ColorConverter() Color colorValue,
      String iconPath,
      int? position});
}

/// @nodoc
class _$FinancialCategoryCopyWithImpl<$Res, $Val extends FinancialCategory>
    implements $FinancialCategoryCopyWith<$Res> {
  _$FinancialCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FinancialCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? colorValue = null,
    Object? iconPath = null,
    Object? position = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      colorValue: null == colorValue
          ? _value.colorValue
          : colorValue // ignore: cast_nullable_to_non_nullable
              as Color,
      iconPath: null == iconPath
          ? _value.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FinancialCategoryImplCopyWith<$Res>
    implements $FinancialCategoryCopyWith<$Res> {
  factory _$$FinancialCategoryImplCopyWith(_$FinancialCategoryImpl value,
          $Res Function(_$FinancialCategoryImpl) then) =
      __$$FinancialCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String name,
      @ColorConverter() Color colorValue,
      String iconPath,
      int? position});
}

/// @nodoc
class __$$FinancialCategoryImplCopyWithImpl<$Res>
    extends _$FinancialCategoryCopyWithImpl<$Res, _$FinancialCategoryImpl>
    implements _$$FinancialCategoryImplCopyWith<$Res> {
  __$$FinancialCategoryImplCopyWithImpl(_$FinancialCategoryImpl _value,
      $Res Function(_$FinancialCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of FinancialCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? colorValue = null,
    Object? iconPath = null,
    Object? position = freezed,
  }) {
    return _then(_$FinancialCategoryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      colorValue: null == colorValue
          ? _value.colorValue
          : colorValue // ignore: cast_nullable_to_non_nullable
              as Color,
      iconPath: null == iconPath
          ? _value.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FinancialCategoryImpl implements _FinancialCategory {
  const _$FinancialCategoryImpl(
      {this.id,
      required this.name,
      @ColorConverter() required this.colorValue,
      required this.iconPath,
      this.position});

  factory _$FinancialCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$FinancialCategoryImplFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  @ColorConverter()
  final Color colorValue;
  @override
  final String iconPath;
  @override
  final int? position;

  @override
  String toString() {
    return 'FinancialCategory(id: $id, name: $name, colorValue: $colorValue, iconPath: $iconPath, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinancialCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.colorValue, colorValue) ||
                other.colorValue == colorValue) &&
            (identical(other.iconPath, iconPath) ||
                other.iconPath == iconPath) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, colorValue, iconPath, position);

  /// Create a copy of FinancialCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FinancialCategoryImplCopyWith<_$FinancialCategoryImpl> get copyWith =>
      __$$FinancialCategoryImplCopyWithImpl<_$FinancialCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FinancialCategoryImplToJson(
      this,
    );
  }
}

abstract class _FinancialCategory implements FinancialCategory {
  const factory _FinancialCategory(
      {final int? id,
      required final String name,
      @ColorConverter() required final Color colorValue,
      required final String iconPath,
      final int? position}) = _$FinancialCategoryImpl;

  factory _FinancialCategory.fromJson(Map<String, dynamic> json) =
      _$FinancialCategoryImpl.fromJson;

  @override
  int? get id;
  @override
  String get name;
  @override
  @ColorConverter()
  Color get colorValue;
  @override
  String get iconPath;
  @override
  int? get position;

  /// Create a copy of FinancialCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FinancialCategoryImplCopyWith<_$FinancialCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
