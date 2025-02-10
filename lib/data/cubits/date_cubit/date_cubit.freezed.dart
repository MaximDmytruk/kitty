// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'date_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DateState {
  DateStatus get status => throw _privateConstructorUsedError;
  String? get errorText => throw _privateConstructorUsedError;
  int get selectedYear => throw _privateConstructorUsedError;
  int get selectedMonth => throw _privateConstructorUsedError;

  /// Create a copy of DateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DateStateCopyWith<DateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateStateCopyWith<$Res> {
  factory $DateStateCopyWith(DateState value, $Res Function(DateState) then) =
      _$DateStateCopyWithImpl<$Res, DateState>;
  @useResult
  $Res call(
      {DateStatus status,
      String? errorText,
      int selectedYear,
      int selectedMonth});
}

/// @nodoc
class _$DateStateCopyWithImpl<$Res, $Val extends DateState>
    implements $DateStateCopyWith<$Res> {
  _$DateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorText = freezed,
    Object? selectedYear = null,
    Object? selectedMonth = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DateStatus,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedYear: null == selectedYear
          ? _value.selectedYear
          : selectedYear // ignore: cast_nullable_to_non_nullable
              as int,
      selectedMonth: null == selectedMonth
          ? _value.selectedMonth
          : selectedMonth // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DateStateImplCopyWith<$Res>
    implements $DateStateCopyWith<$Res> {
  factory _$$DateStateImplCopyWith(
          _$DateStateImpl value, $Res Function(_$DateStateImpl) then) =
      __$$DateStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateStatus status,
      String? errorText,
      int selectedYear,
      int selectedMonth});
}

/// @nodoc
class __$$DateStateImplCopyWithImpl<$Res>
    extends _$DateStateCopyWithImpl<$Res, _$DateStateImpl>
    implements _$$DateStateImplCopyWith<$Res> {
  __$$DateStateImplCopyWithImpl(
      _$DateStateImpl _value, $Res Function(_$DateStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? errorText = freezed,
    Object? selectedYear = null,
    Object? selectedMonth = null,
  }) {
    return _then(_$DateStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DateStatus,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedYear: null == selectedYear
          ? _value.selectedYear
          : selectedYear // ignore: cast_nullable_to_non_nullable
              as int,
      selectedMonth: null == selectedMonth
          ? _value.selectedMonth
          : selectedMonth // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DateStateImpl implements _DateState {
  const _$DateStateImpl(
      {this.status = DateStatus.initial,
      this.errorText,
      required this.selectedYear,
      required this.selectedMonth});

  @override
  @JsonKey()
  final DateStatus status;
  @override
  final String? errorText;
  @override
  final int selectedYear;
  @override
  final int selectedMonth;

  @override
  String toString() {
    return 'DateState(status: $status, errorText: $errorText, selectedYear: $selectedYear, selectedMonth: $selectedMonth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DateStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText) &&
            (identical(other.selectedYear, selectedYear) ||
                other.selectedYear == selectedYear) &&
            (identical(other.selectedMonth, selectedMonth) ||
                other.selectedMonth == selectedMonth));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, errorText, selectedYear, selectedMonth);

  /// Create a copy of DateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DateStateImplCopyWith<_$DateStateImpl> get copyWith =>
      __$$DateStateImplCopyWithImpl<_$DateStateImpl>(this, _$identity);
}

abstract class _DateState implements DateState {
  const factory _DateState(
      {final DateStatus status,
      final String? errorText,
      required final int selectedYear,
      required final int selectedMonth}) = _$DateStateImpl;

  @override
  DateStatus get status;
  @override
  String? get errorText;
  @override
  int get selectedYear;
  @override
  int get selectedMonth;

  /// Create a copy of DateState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DateStateImplCopyWith<_$DateStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
