// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fin_transaction_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FinTransactionState {
  FinTransactionStatus get status => throw _privateConstructorUsedError;
  List<FinancialCategory>? get categories => throw _privateConstructorUsedError;
  String? get errorText => throw _privateConstructorUsedError;
  String? get toastText => throw _privateConstructorUsedError;

  /// Create a copy of FinTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FinTransactionStateCopyWith<FinTransactionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinTransactionStateCopyWith<$Res> {
  factory $FinTransactionStateCopyWith(
          FinTransactionState value, $Res Function(FinTransactionState) then) =
      _$FinTransactionStateCopyWithImpl<$Res, FinTransactionState>;
  @useResult
  $Res call(
      {FinTransactionStatus status,
      List<FinancialCategory>? categories,
      String? errorText,
      String? toastText});
}

/// @nodoc
class _$FinTransactionStateCopyWithImpl<$Res, $Val extends FinTransactionState>
    implements $FinTransactionStateCopyWith<$Res> {
  _$FinTransactionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FinTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? categories = freezed,
    Object? errorText = freezed,
    Object? toastText = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FinTransactionStatus,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<FinancialCategory>?,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
      toastText: freezed == toastText
          ? _value.toastText
          : toastText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FinTransactionStateImplCopyWith<$Res>
    implements $FinTransactionStateCopyWith<$Res> {
  factory _$$FinTransactionStateImplCopyWith(_$FinTransactionStateImpl value,
          $Res Function(_$FinTransactionStateImpl) then) =
      __$$FinTransactionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FinTransactionStatus status,
      List<FinancialCategory>? categories,
      String? errorText,
      String? toastText});
}

/// @nodoc
class __$$FinTransactionStateImplCopyWithImpl<$Res>
    extends _$FinTransactionStateCopyWithImpl<$Res, _$FinTransactionStateImpl>
    implements _$$FinTransactionStateImplCopyWith<$Res> {
  __$$FinTransactionStateImplCopyWithImpl(_$FinTransactionStateImpl _value,
      $Res Function(_$FinTransactionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FinTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? categories = freezed,
    Object? errorText = freezed,
    Object? toastText = freezed,
  }) {
    return _then(_$FinTransactionStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FinTransactionStatus,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<FinancialCategory>?,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
      toastText: freezed == toastText
          ? _value.toastText
          : toastText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FinTransactionStateImpl implements _FinTransactionState {
  const _$FinTransactionStateImpl(
      {this.status = FinTransactionStatus.initial,
      final List<FinancialCategory>? categories,
      this.errorText,
      this.toastText})
      : _categories = categories;

  @override
  @JsonKey()
  final FinTransactionStatus status;
  final List<FinancialCategory>? _categories;
  @override
  List<FinancialCategory>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? errorText;
  @override
  final String? toastText;

  @override
  String toString() {
    return 'FinTransactionState(status: $status, categories: $categories, errorText: $errorText, toastText: $toastText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinTransactionStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText) &&
            (identical(other.toastText, toastText) ||
                other.toastText == toastText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_categories), errorText, toastText);

  /// Create a copy of FinTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FinTransactionStateImplCopyWith<_$FinTransactionStateImpl> get copyWith =>
      __$$FinTransactionStateImplCopyWithImpl<_$FinTransactionStateImpl>(
          this, _$identity);
}

abstract class _FinTransactionState implements FinTransactionState {
  const factory _FinTransactionState(
      {final FinTransactionStatus status,
      final List<FinancialCategory>? categories,
      final String? errorText,
      final String? toastText}) = _$FinTransactionStateImpl;

  @override
  FinTransactionStatus get status;
  @override
  List<FinancialCategory>? get categories;
  @override
  String? get errorText;
  @override
  String? get toastText;

  /// Create a copy of FinTransactionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FinTransactionStateImplCopyWith<_$FinTransactionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
