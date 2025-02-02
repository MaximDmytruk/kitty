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
abstract class _$$DateStatusImplCopyWith<$Res>
    implements $DateStateCopyWith<$Res> {
  factory _$$DateStatusImplCopyWith(
          _$DateStatusImpl value, $Res Function(_$DateStatusImpl) then) =
      __$$DateStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateStatus status,
      String? errorText,
      int selectedYear,
      int selectedMonth});
}

/// @nodoc
class __$$DateStatusImplCopyWithImpl<$Res>
    extends _$DateStateCopyWithImpl<$Res, _$DateStatusImpl>
    implements _$$DateStatusImplCopyWith<$Res> {
  __$$DateStatusImplCopyWithImpl(
      _$DateStatusImpl _value, $Res Function(_$DateStatusImpl) _then)
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
    return _then(_$DateStatusImpl(
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

class _$DateStatusImpl implements _DateStatus {
  const _$DateStatusImpl(
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
            other is _$DateStatusImpl &&
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
  _$$DateStatusImplCopyWith<_$DateStatusImpl> get copyWith =>
      __$$DateStatusImplCopyWithImpl<_$DateStatusImpl>(this, _$identity);
}

abstract class _DateStatus implements DateState {
  const factory _DateStatus(
      {final DateStatus status,
      final String? errorText,
      required final int selectedYear,
      required final int selectedMonth}) = _$DateStatusImpl;

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
  _$$DateStatusImplCopyWith<_$DateStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
