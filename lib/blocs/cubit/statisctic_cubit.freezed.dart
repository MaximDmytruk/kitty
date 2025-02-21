// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statisctic_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StatisticsState {
  StatisticsStatus get status => throw _privateConstructorUsedError;
  Map<int, int> get categoryTotalAmount => throw _privateConstructorUsedError;
  Map<int, double> get categoryPercentages =>
      throw _privateConstructorUsedError;
  Map<int, Color> get categoryColors => throw _privateConstructorUsedError;
  String? get errorText => throw _privateConstructorUsedError;

  /// Create a copy of StatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatisticsStateCopyWith<StatisticsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticsStateCopyWith<$Res> {
  factory $StatisticsStateCopyWith(
          StatisticsState value, $Res Function(StatisticsState) then) =
      _$StatisticsStateCopyWithImpl<$Res, StatisticsState>;
  @useResult
  $Res call(
      {StatisticsStatus status,
      Map<int, int> categoryTotalAmount,
      Map<int, double> categoryPercentages,
      Map<int, Color> categoryColors,
      String? errorText});
}

/// @nodoc
class _$StatisticsStateCopyWithImpl<$Res, $Val extends StatisticsState>
    implements $StatisticsStateCopyWith<$Res> {
  _$StatisticsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? categoryTotalAmount = null,
    Object? categoryPercentages = null,
    Object? categoryColors = null,
    Object? errorText = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatisticsStatus,
      categoryTotalAmount: null == categoryTotalAmount
          ? _value.categoryTotalAmount
          : categoryTotalAmount // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      categoryPercentages: null == categoryPercentages
          ? _value.categoryPercentages
          : categoryPercentages // ignore: cast_nullable_to_non_nullable
              as Map<int, double>,
      categoryColors: null == categoryColors
          ? _value.categoryColors
          : categoryColors // ignore: cast_nullable_to_non_nullable
              as Map<int, Color>,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatisticsStateImplCopyWith<$Res>
    implements $StatisticsStateCopyWith<$Res> {
  factory _$$StatisticsStateImplCopyWith(_$StatisticsStateImpl value,
          $Res Function(_$StatisticsStateImpl) then) =
      __$$StatisticsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StatisticsStatus status,
      Map<int, int> categoryTotalAmount,
      Map<int, double> categoryPercentages,
      Map<int, Color> categoryColors,
      String? errorText});
}

/// @nodoc
class __$$StatisticsStateImplCopyWithImpl<$Res>
    extends _$StatisticsStateCopyWithImpl<$Res, _$StatisticsStateImpl>
    implements _$$StatisticsStateImplCopyWith<$Res> {
  __$$StatisticsStateImplCopyWithImpl(
      _$StatisticsStateImpl _value, $Res Function(_$StatisticsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? categoryTotalAmount = null,
    Object? categoryPercentages = null,
    Object? categoryColors = null,
    Object? errorText = freezed,
  }) {
    return _then(_$StatisticsStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatisticsStatus,
      categoryTotalAmount: null == categoryTotalAmount
          ? _value._categoryTotalAmount
          : categoryTotalAmount // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      categoryPercentages: null == categoryPercentages
          ? _value._categoryPercentages
          : categoryPercentages // ignore: cast_nullable_to_non_nullable
              as Map<int, double>,
      categoryColors: null == categoryColors
          ? _value._categoryColors
          : categoryColors // ignore: cast_nullable_to_non_nullable
              as Map<int, Color>,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$StatisticsStateImpl implements _StatisticsState {
  const _$StatisticsStateImpl(
      {this.status = StatisticsStatus.initial,
      final Map<int, int> categoryTotalAmount = const {},
      final Map<int, double> categoryPercentages = const {},
      final Map<int, Color> categoryColors = const {},
      this.errorText})
      : _categoryTotalAmount = categoryTotalAmount,
        _categoryPercentages = categoryPercentages,
        _categoryColors = categoryColors;

  @override
  @JsonKey()
  final StatisticsStatus status;
  final Map<int, int> _categoryTotalAmount;
  @override
  @JsonKey()
  Map<int, int> get categoryTotalAmount {
    if (_categoryTotalAmount is EqualUnmodifiableMapView)
      return _categoryTotalAmount;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categoryTotalAmount);
  }

  final Map<int, double> _categoryPercentages;
  @override
  @JsonKey()
  Map<int, double> get categoryPercentages {
    if (_categoryPercentages is EqualUnmodifiableMapView)
      return _categoryPercentages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categoryPercentages);
  }

  final Map<int, Color> _categoryColors;
  @override
  @JsonKey()
  Map<int, Color> get categoryColors {
    if (_categoryColors is EqualUnmodifiableMapView) return _categoryColors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categoryColors);
  }

  @override
  final String? errorText;

  @override
  String toString() {
    return 'StatisticsState(status: $status, categoryTotalAmount: $categoryTotalAmount, categoryPercentages: $categoryPercentages, categoryColors: $categoryColors, errorText: $errorText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatisticsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._categoryTotalAmount, _categoryTotalAmount) &&
            const DeepCollectionEquality()
                .equals(other._categoryPercentages, _categoryPercentages) &&
            const DeepCollectionEquality()
                .equals(other._categoryColors, _categoryColors) &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_categoryTotalAmount),
      const DeepCollectionEquality().hash(_categoryPercentages),
      const DeepCollectionEquality().hash(_categoryColors),
      errorText);

  /// Create a copy of StatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatisticsStateImplCopyWith<_$StatisticsStateImpl> get copyWith =>
      __$$StatisticsStateImplCopyWithImpl<_$StatisticsStateImpl>(
          this, _$identity);
}

abstract class _StatisticsState implements StatisticsState {
  const factory _StatisticsState(
      {final StatisticsStatus status,
      final Map<int, int> categoryTotalAmount,
      final Map<int, double> categoryPercentages,
      final Map<int, Color> categoryColors,
      final String? errorText}) = _$StatisticsStateImpl;

  @override
  StatisticsStatus get status;
  @override
  Map<int, int> get categoryTotalAmount;
  @override
  Map<int, double> get categoryPercentages;
  @override
  Map<int, Color> get categoryColors;
  @override
  String? get errorText;

  /// Create a copy of StatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatisticsStateImplCopyWith<_$StatisticsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
